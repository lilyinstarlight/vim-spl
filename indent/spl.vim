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
setlocal indentkeys+=0=\|,0=[,0=]
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
  " no indent on first line
  if pnum == 0
    return 0
  endif
  let pline=CleanSPL(getline(pnum))

  " get previous previous line
  let ppnum=GetSPLPrevious(pnum)
  let ppline=CleanSPL(getline(ppnum))

  " get current indent
  let ind=indent(pnum)

  " assume we did not calculate indent
  let indented=0

  " if the previous line contains a new subsearch
  if pline =~ '\v\[[^\]]*'
    let ind+=&sw
    let indented=1
  " if the previous line ends a subsearch
  elseif pline =~ '\v[^\[]*\]'
    let ind-=&sw
    let indented=1
  endif
  " if this line ends a subsearch
  if line =~ '\v^\]'
    let ind-=&sw
    let indented=1
  endif
  " if the previous line ended with a pipe
  if ppline !~ '\v\|$' && pline !~ '\v^\|' && pline =~ '\v\|$'
    let ind+=&sw
    let indented=1
  " if this line starts a new pipe
  elseif ppline !~ '\v\|$' && pline !~ '\v^\|' && line =~ '\v^\|'
    let ind+=&sw
    let indented=1
  " if the last line ended in a pipe do not indent
  elseif pline =~ '\v\|$'
    let indented=1
  " if the last line had a pipe do not indent
  elseif (ppline =~ '\v\|$' && line =~ '\v^\|') || (pline =~ '\v^\|' && line =~ '\v^\|')
    let indented=1
  endif

  " if this line starts a new search (i.e. not indented for another reason)
  if indented == 0
    let ind=0
  endif

  " return calculated indent
  return ind
endfunction
