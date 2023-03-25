" Vim indent file
" Language:	Cucumber
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2017 Jun 13

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetCucumberIndent()
setlocal indentkeys=o,O,*<Return>,<:>,0<Bar>,0#,=,!^F

let b:undo_indent = 'setl ai< inde< indk<'

" Only define the function once.
if exists("*GetCucumberIndent")
  finish
endif

let s:headings = {
      \ 'Feature': 'feature',
      \ 'Rule': 'rule',
      \ 'Background': 'bg_or_scenario',
      \ 'Scenario': 'bg_or_scenario',
      \ 'ScenarioOutline': 'bg_or_scenario',
      \ 'Examples': 'examples',
      \ 'Scenarios': 'examples'}

function! s:Line(lnum) abort
  if getline(a:lnum) =~# ':'
    let group = matchstr(synIDattr(synID(a:lnum,1+indent(a:lnum), 1), 'name'), '^cucumber\zs.*')
    if !has_key(s:headings, group)
      let group = substitute(matchstr(getline(a:lnum), '^\s*\zs\%([^:]\+\)\ze:\S\@!'), '\s\+', '', 'g')
    endif
  else
    let group = ''
  endif
  let char = matchstr(getline(a:lnum), '^\s*\zs[[:punct:]]')
  return {
        \ 'lnum': a:lnum,
        \ 'indent': indent(a:lnum),
        \ 'heading': get(s:headings, group, ''),
        \ 'tag': char ==# '@',
        \ 'table': char ==# '|',
        \ 'comment': char ==# '#',
        \ }
endfunction

function! GetCucumberIndent(...) abort
  let lnum = a:0 ? a:1 : v:lnum
  let sw = shiftwidth()
  let prev = s:Line(prevnonblank(lnum-1))
  let curr = s:Line(lnum)

  if (curr.tag || curr.comment) && (prev.tag || prev.comment)
    return prev.indent
  endif

  let head = prev
  while head.lnum > 0 && empty(head.heading)
    let head = s:Line(prevnonblank(head.lnum-1))
  endwhile
  if curr.comment && getline(curr.lnum-1) =~# '^\s*$' || curr.tag
    let next = s:Line(nextnonblank(curr.lnum+1))
    while next.comment || next.tag
      let next = s:Line(nextnonblank(next.lnum+1))
    endwhile
    " if a comment or tag appears precedes a heading...
    if !empty(next.heading)
      " indent it like we would the heading
      let curr = next
    endif
  endif

  if !empty(prev.heading) && empty(curr.heading)
    " for a non-heading after a heading, increase the indent
    return prev.indent + sw
  elseif !empty(curr.heading) && curr.heading ==# head.heading
    " if the previous section is a peer, match the heading's indent
    return head.indent
  elseif curr.heading ==# 'feature'
    return 0
  elseif curr.heading ==# 'rule'
    return sw
  elseif curr.heading ==# 'bg_or_scenario' && head.heading ==# 'examples'
    return head.indent - sw
  elseif (curr.heading ==# 'bg_or_scenario' && head.heading ==# 'rule') || (curr.heading ==# 'examples' && head.heading ==# 'bg_or_scenario')
    return head.indent + sw
  elseif (head.heading ==# 'rule' || head.heading ==# 'feature') && !empty(curr.heading)
    return head.indent + sw
  elseif curr.tag && empty(head.heading)
    return 0
  elseif curr.tag && head.heading ==# 'examples'
    return head.indent - sw
  elseif curr.tag
    return head.indent
  elseif (curr.table || curr.comment) && prev.table
    " mid-table
    " preserve indent
    return prev.indent
  elseif curr.table && !prev.table
    " first line of a table, relative indent
    return prev.indent + sw
  elseif !curr.table && prev.table
    " line after a table, relative unindent
    return prev.indent - sw
  endif

  endif
  return prev.indent < 0 ? 0 : prev.indent
endfunction

" vim:set sts=2 sw=2:
