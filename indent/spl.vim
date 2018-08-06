" Vim indent file
" Language: SPL
" Maintainer: Foster McLane
" Last Change: 2018-08-06

" guard against multiple indents
if exists('b:did_indent')
  finish
endif
let b:did_indent=1

" set indent settings
setlocal indentexpr=GetSPLIndent(v:lnum)
setlocal indentkeys+=0=|,0[,0]
setlocal indentkeys-=0{,0},0),:,0#,e
setlocal nosmartindent

" comment and whitespace cleanup function
function! CleanSPL(line)
  let line = a:line

  let line = substitute(line, '^\s*', '', '')
  let line = substitute(line, '\s*$', '', '')

  return line
endfunction

function! GetSPLPrevious(num)
  if a:num == 0
    return 0
  endif

  let pnum=a:num-1
  let pline=CleanSPL(getline(pnum))
  while pline =~ '\v^$'
    if pnum == 0
      return pnum
    endif

    let pnum-=1
    let pline=CleanSPL(getline(pnum))
  endwhile

  return pnum
endfunction

" indent function
function! GetSPLIndent(lnum)
  " get current line
  let num=a:lnum
  let line=CleanSPL(getline(num))

  " get previous line
  let pnum=GetSPLPrevious(num)
  " no indent and always indent on second line first line
  if pnum == 0
    return 0
  endif
  let pline=CleanSPL(getline(pnum))

  " get current indent
  let ind=indent(pnum)

  " if the previous line contains a new subsearch
  if pline =~ '\v\['
    let ind+=&sw
  " if the previous line ends a subsearch
  elseif pline =~ '\v\]'
    let ind-=&sw
  " if this line ends a subsearch
  elseif line =~ '\v^\]'
    let ind-=&sw
  " if this line starts a new pipe
  elseif line =~ '\v^\s*|'
    let ind+=&sw
  " if this line ends a pipe
  elseif line !~ '\v^\s*|'
    let ind-=&sw
  endif

  " return calculated indent
  return ind
endfunction
