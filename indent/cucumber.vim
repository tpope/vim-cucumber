" Vim indent file
" Language:	Cucumber
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 May 21

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetCucumberIndent()
setlocal indentkeys=o,O,*<Return>,<:>,0<Bar>,0#,=,!^F

" Only define the function once.
if exists("*GetCucumberIndent")
  finish
endif

function! s:syn(lnum)
  return synIDattr(synID(a:lnum,1+indent(a:lnum),1),'name')
endfunction

function! GetCucumberIndent()
  let line  = getline(prevnonblank(v:lnum-1))
  let cline = getline(v:lnum)
  let nline = getline(nextnonblank(v:lnum+1))
  let syn = s:syn(prevnonblank(v:lnum-1))
  let csyn = s:syn(v:lnum)
  let nsyn = s:syn(nextnonblank(v:lnum+1))
  if csyn ==# 'cucumberFeature' || cline =~# '^\s*Feature:'
    return 0
  elseif csyn ==# 'cucumberExamples' || cline =~# '^\s*\%(Examples\|Scenarios\):'
    return 2 * &sw
  elseif csyn =~# '^cucumber\%(Background\|Scenario\|ScenarioOutline\)$' || cline =~# '^\s*\%(Background\|Scenario\|Scenario Outline\):'
    return &sw
  elseif syn ==# 'cucumberFeature' || line =~# '^\s*Feature:'
    return &sw
  elseif syn ==# 'cucumberExamples' || line =~# '^\s*\%(Examples\|Scenarios\):'
    return 3 * &sw
  elseif syn =~# '^cucumber\%(Background\|Scenario\|ScenarioOutline\)$' || line =~# '^\s*\%(Background\|Scenario\|Scenario Outline\):'
    return 2 * &sw
  elseif cline =~# '^\s*@' && (nsyn == 'cucumberFeature' || nline =~# '^\s*Feature:' || indent(prevnonblank(v:lnum-1)) <= 0)
    return 0
  elseif line =~# '^\s*@'
    return &sw
  elseif cline =~# '^\s*|' && line =~# '^\s*|'
    return indent(prevnonblank(v:lnum-1))
  elseif cline =~# '^\s*|' && line =~# '^\s*[^|#]'
    return indent(prevnonblank(v:lnum-1)) + &sw
  elseif cline =~# '^\s*[^|# \t]' && line =~# '^\s*|'
    return indent(prevnonblank(v:lnum-1)) - &sw
  elseif cline =~# '^\s*$' && line =~# '^\s*|'
    let in = indent(prevnonblank(v:lnum-1))
    return in == indent(v:lnum) ? in : in - &sw
  elseif cline =~# '^\s*#' && getline(v:lnum-1) =~ '^\s*$' && getline(v:lnum+1) =~# '\S'
    return indent(getline(v:lnum+1))
  endif
  return indent(prevnonblank(v:lnum-1))
endfunction

" vim:set sts=2 sw=2:
