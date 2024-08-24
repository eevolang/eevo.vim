" Vim syntax file
" Language: tisp
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      edryd.org/projects/tisp

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
syn keyword tispSyntax cons quote quasiquote unquote do do0 eval cond
syn keyword tispSyntax set! def defmacro Func Macro load quit error assert
syn keyword tispSyntax if else when unless let recur switch
syn keyword tispSyntax not and or nand nor
syn keyword tispSyntax typeof Void Bool Pair Int Dec Str Sym get

" functions
syn keyword tispFunc any? nil? empty? void? atom? string? symbol? pair? cons? list?
syn keyword tispFunc function? specialform? primitive? macro? builtin? procedure?
syn keyword tispFunc integer? ratio? decimal? rational? number?
syn keyword tispFunc boolean? true? false?
syn keyword tispFunc version repl ans doc default

" math
syn keyword tispFunc + - * / ^ mod ! = /= < <= = > >=
syn keyword tispFunc inc dec round truncate floor ceiling
syn keyword tispFunc sqr cube root sqrt cbrt exp log log10 logb
syn keyword tispFunc abs sgn max min numerator denominator dot norm
syn keyword tispFunc sin sinh cos cosh tan tanh
syn keyword tispFunc arcsin arcsinh arccos arccosh arctan arctanh
syn keyword tispFunc csc csch sec sech cot coth
syn keyword tispFunc arccsc arccsch arcsec arcsech arccot arccoth
syn keyword tispFunc negative? positive? zero? even? odd?

" i/o
syn keyword tispFunc read parse write save open run print println display displayln newline
syn keyword tispNumber stdout stderr

" os
syn keyword tispFunc cd! pwd now time

" list
syn keyword tispFunc list list* length last nth head tail count
syn keyword tispFunc apply map convert assoc filter keep remove memp member everyp? every?
syn keyword tispFunc compose reverse append zip

" stack
syn keyword tispFunc push push! pop pop! peek swap swap!

" cxr
syn keyword tispFunc car cdr caar cadr cdar cddr caaar caadr cadar caddr cdaar
syn keyword tispFunc cdadr cddar cdddr caaaar caaadr caadar caaddr cadaar
syn keyword tispFunc cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr cddaar
syn keyword tispFunc cddadr cdddar cddddr first rest
syn keyword tispFunc second third forth fifth sixth seventh eighth ninth tenth

" lambda sign
" syn match tispSyntax /\<[\u03bb]\>/

syn region tispString start='\%(\\\)\@<!"' skip='\\[\\"]' end='"' contains=@Spell

syn match tispComment ';.*$' contains=tispTodo,tispNote,@Spell
syn keyword tispTodo FIXME TODO XXX contained
syn keyword tispNote '\CNOTE\ze:\?' contained

syn match tispDelimiter '\<\.\>'

syn keyword tispNumber e pi tau
syn match tispNumber "[+-]\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([eE][-+]\=\d\+\)\="
syn match tispNumber "[+-]\=\(\d\+/\d\+\)"

syn match tispSymbol ,\k+, contained

syn keyword tispBoolean True () Nil False it

syn cluster tispNormal  contains=tispSyntax,tispFunc,tispDelimiter
syn cluster tispQuotedStuff  contains=tispSymbol
syn cluster tispQuotedOrNormal  contains=tispDelimiter

syn region tispStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region tispQuoted matchgroup=Delimiter start="['`]" end=![ \t()";]!me=e-1 contains=ALL

syn region tispQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALL

syn region tispUnquote matchgroup=Delimiter start="," end=![ \t()";]!me=e-1 contains=ALL
syn region tispUnquote matchgroup=Delimiter start=",@" end=![ \t()";]!me=e-1 contains=ALL

syn region tispUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region tispUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

" Comments
syn cluster tispNormal  add=tispQuoted,tispComment
syn cluster tispQuotedOrNormal  add=tispComment


" Synchronization and the wrapping up...
syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
hi def link tispSyntax             Statement
hi def link tispFunc               Function

hi def link tispString             String
hi def link tispChar               Character
hi def link tispBoolean            Boolean

hi def link tispNumber             Number
hi def link tispNumberError        Error

hi def link tispQuoted             Structure
hi def link tispSymbol             Structure

hi def link tispDelimiter          Delimiter
hi def link tispConstant           Constant

hi def link tispComment            Comment
hi def link tispTodo               Todo
hi def link tispNote               SpecialComment
hi def link tispError              Error

let b:current_syntax = "tisp"
