" Vim syntax file
" Language: tisp
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      edryd.org/projects/tisp.html

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" highlight unmatched parens
syn match tispError '[]})]'

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" built-ins
syn keyword tispSyntax cons quote void do eval cond
syn keyword tispSyntax define lambda macro load quit
syn keyword tispSyntax if else when unless let recur
syn keyword tispSyntax not and or nand nor

" functions
syn keyword tispFunc type version repl ans
syn keyword tispFunc nil? void? string? symbol?
syn keyword tispFunc function? primitive? pair?
syn keyword tispFunc integer? ratio? decimal? rational? number?

" math
syn keyword tispFunc + - * / ^ mod ! = < <= = > >=
syn keyword tispFunc dec round truncate floor ceiling
syn keyword tispFunc sqr root sqrt cbrt exp log log10 logb
syn keyword tispFunc abs sgn max min numerator denominator
syn keyword tispFunc sin sinh cos cosh tan tanh
syn keyword tispFunc arcsin arcsinh arccos arccosh arctan arctanh
syn keyword tispFunc negative? positive? zero? even? odd?

" i/o
syn keyword tispFunc read print disp disp-string newline

" list
syn keyword tispFunc list last apply foreach map append member?

" cxr
syn keyword tispFunc car cdr caar cadr cdar cddr caaar caadr cadar caddr cdaar
syn keyword tispFunc cdadr cddar cdddr caaaar caaadr caadar caaddr cadaar
syn keyword tispFunc cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr cddaar
syn keyword tispFunc cddadr cdddar cddddr first rest

" lambda sign
" syn match tispSyntax /\<[\u03bb]\>/

syn region tispString start='\%(\\\)\@<!"' skip='\\[\\"]' end='"' contains=@Spell

syn match tispComment ';.*$' contains=tispTodo,tispNote,@Spell
syn keyword tispTodo FIXME TODO XXX contained
syn keyword tispNote '\CNOTE\ze:\?' contained

syn match tispDelimiter '\<\.\>'

syn keyword tispNumber e pi tau
syn match tispNumber "[+-]\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([eE/][-+]\=\d\+\)\="
syn match tispError ![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match tispSymbol ,\k+, contained

syn keyword tispBoolean t ()

syn cluster tispNormal  contains=tispSyntax,tispFunc,tispDelimiter
syn cluster tispQuotedStuff  contains=tispSymbol
syn cluster tispQuotedOrNormal  contains=tispDelimiter

syn region tispQuoted matchgroup=Delimiter start="['`]" end='[ \t()";]'me=e-1 contains=@tispQuotedStuff,@tispQuotedOrNormal
syn region tispQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=@tispQuotedStuff,@tispQuotedOrNormal

syn region tispQuoted matchgroup=Delimiter start="#['`]"rs=s+2 end='[ \t()";]'re=e-1,me=e-1 contains=@tispQuotedStuff,@tispQuotedOrNormal
syn region tispQuoted matchgroup=Delimiter start="#['`]("rs=s+3 matchgroup=Delimiter end=")"re=e-1 contains=@tispQuotedStuff,@tispQuotedOrNormal

" Comments
syn cluster tispNormal  add=tispQuoted,tispComment
syn cluster tispQuotedOrNormal  add=tispComment


" Synchronization and the wrapping up...
syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tisp_syntax_inits")
  if version < 508
    let did_tisp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tispSyntax             Statement
  HiLink tispFunc               Function

  HiLink tispString             String
  HiLink tispChar               Character
  HiLink tispBoolean            Boolean

  HiLink tispNumber             Number
  HiLink tispNumberError        Error

  HiLink tispQuoted             Structure
  HiLink tispSymbol             Structure

  HiLink tispDelimiter          Delimiter
  HiLink tispConstant           Constant

  HiLink tispComment            Comment
  HiLink tispTodo               Todo
  HiLink tispNote               SpecialComment
  HiLink tispError              Error

  delcommand HiLink
endif

let b:current_syntax = "tisp"
