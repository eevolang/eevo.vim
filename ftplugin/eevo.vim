" Vim filetype plugin
" Language: eevo
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      eevo.pub

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setl lisp
setl comments=:;
setl commentstring=;\ %s
setl define=^\\s*(def\\k*
setl formatoptions-=t
setl iskeyword+=+,-,*,/,%,<,=,>,:,$,?,!,@-@,94
setl lispwords+=def,recur,switch
setl foldmethod=expr
setl foldexpr=getline(v:lnum)=~'^;;;'?'>1':1

if exists('g:paredit_loaded')
  call PareditInitBuffer()
endif

let b:undo_ftplugin = "setlocal lisp< comments< commentstring< define< formatoptions< iskeyword< lispwords<"
