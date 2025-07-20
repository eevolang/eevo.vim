" Vim filetype plugin
" Language: eevp
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      eevo.pub

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

runtime! indent/lisp.vim
