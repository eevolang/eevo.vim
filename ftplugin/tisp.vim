" Vim filetype plugin
" Language: tisp
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      edryd.org/projects/tisp.html

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
