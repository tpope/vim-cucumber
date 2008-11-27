" Vim filetype plugin
" Language:	Cucumber
" Maintainer:	Tim Pope <vimNOSPAM@tpope.info>

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:# commentstring=#\ %s

let b:undo_ftplugin = "setl fo< com< cms<"

let b:cucumber_root = expand('%:p:h:s?.*[\/]\%(features\|stories\)\zs[\/].*??')

if !exists("g:no_plugin_maps") && !exists("g:no_cucumber_maps")
  nmap <silent><buffer> <C-]>       :<C-U>exe <SID>jump('edit')<CR>
  nmap <silent><buffer> <C-W>]      :<C-U>exe <SID>jump('split')<CR>
  nmap <silent><buffer> <C-W><C-]>  :<C-U>exe <SID>jump('split')<CR>
  nmap <silent><buffer> <C-W>}      :<C-U>exe <SID>jump('pedit')<CR>
  let b:undo_ftplugin .= "| sil! iunmap! <C-]>| sil! iunmap! <C-W>]| sil! iunmap! <C-W>}"
endif

function! s:jump(command)
  let steps = s:steps(getline('.'))
  if len(steps) == 0
    return 'echoerr "No matching step found"'
  elseif len(steps) > 1
    return 'echoerr "Multiple matching steps found"'
  else
    return a:command.' +'.steps[0][1].' '.escape(steps[0][0],' %#')
  endif
endfunction

function! s:steps(step)
  let step_pattern = '\C^\s*\%(Giv\|[WT]h\)en\>\s*\zs.\{-\}\ze\s*\%(do\|{\)\s*\%(|[A-Za-z0-9_,() *]*|\s*\)\=$'
  let steps = []
  for file in split(glob(b:cucumber_root.'/**/*.rb'),"\n")
    let lines = readfile(file)
    let num = 0
    for line in lines
      let num += 1
      if line =~ step_pattern
        let steps += [[file,num,matchstr(line,step_pattern)]]
      endif
    endfor
  endfor
  let step = matchstr(a:step,'^\s*\k*\s*\zs.\{-\}\s*$')
  call filter(steps,'s:stepmatch(v:val[2],step)')
  return steps
endfunction

function! s:stepmatch(receiver,target)
  if a:receiver =~ '^[''"].*[''"]$'
    let pattern = '^'.escape(substitute(a:receiver[1:-2],'$\w\+','(.*)','g'),'/').'$'
  elseif a:receiver =~ '^/.*/$'
    let pattern = a:receiver[1:-2]
  elseif a:receiver =~ '^%r..*.$'
    let pattern = escape(a:receiver[3:-2],'/')
  else
    return 0
  endif
  try
    let vimpattern = substitute(substitute(pattern,'\\\@<!(?:','%(','g'),'\\\@<!\*?','{-}','g')
    if a:target =~# '\v'.vimpattern
      return 1
    endif
  catch
  endtry
  if has("ruby")
    ruby VIM.command("return #{if (begin; Kernel.eval('/'+VIM.evaluate('pattern')+'/'); rescue SyntaxError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
  else
    return 0
  endif
endfunction

" vim:set sts=2 sw=2:
