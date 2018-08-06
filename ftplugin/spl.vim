" Vim filetype plugin file
" Language: SPL
" Maintainer: Foster McLane
" Last Change: 2018-08-06

" guard against multiple ftplugins
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin=1

" save cpoptions
let s:cpoptions_save=&cpoptions
set cpoptions&vim

" tabbing settings
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" comment information
setlocal comments=sO:`comment(\",exO:\")`
setlocal commentstring=`comment(\"%s\")`

" formatting options
setlocal formatoptions+=cq

" restore cpoptions
let &cpoptions=s:cpoptions_save
unlet s:cpoptions_save
