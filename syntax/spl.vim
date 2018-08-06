" Vim syntax file
" Language: SPL
" Maintainer: Foster McLane
" Last Change: 2018-08-06

" guard for other syntaxes
if exists('b:current_syntax')
  finish
endif
let b:current_syntax='spl'

" comments
syn region splComment start='`comment("' end='")`'

" strings
syntax region splDoubleString start=/"/ skip=/\\"/ end=/"/
syntax region splSingleString start=/'/ skip=/\\'/ end=/'/

" numbers
syntax match splNumber '\v<\d+>'
syntax match splFloat '\v<\d+\.\d+>'
"
" contexts
syntax keyword splConstant
      \ false
      \ true

" separators
syntax keyword splSeparator
      \ =

" eval context
syntax keyword splOperator
      \ +
      \ -
      \ *
      \ /
      \ ==
      \ /=
      \ <
      \ <=
      \ >
      \ >=

" set highlights
highlight default link splComment Comment

highlight default link splDoubleString String
highlight default link splSingleString String

highlight default link splNumber Number
highlight default link splFloat Float

highlight default link splSeparator Special

highlight default link splConstant Constant

highlight default link splOperator Operator
