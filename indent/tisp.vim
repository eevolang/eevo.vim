" Vim filetype plugin
" Language: tisp
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      edryd.org/projects/tisp

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

runtime! indent/lisp.vim
