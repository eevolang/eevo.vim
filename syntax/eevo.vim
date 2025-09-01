" Vim syntax file
" Language: eevo
" Author:   Ed van Bruggen <ed@edryd.org>
" URL:      eevo.pub

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" highlight unmatched parens
syn match eevoError '[]})]'

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" built-ins
syn keyword eevoSyntax quote quasiquote unquote do do0 eval cond records
syn keyword eevoSyntax def defmacro Func Macro load quit error assert procprops
syn keyword eevoSyntax if else when unless let recur switch undefine! defined?
" TODO color operators differently
syn keyword eevoSyntax not and or nand nor
syn keyword eevoSyntax typeof Void Bool Pair Int Dec Str Sym

" functions
syn keyword eevoFunc any? nil? empty? void? atom? string? symbol? pair? cons? list?
syn keyword eevoFunc function? specialform? primitive? macro? builtin? procedure? record?
syn keyword eevoFunc integer? ratio? decimal? rational? number?
syn keyword eevoFunc boolean? true? false?
syn keyword eevoFunc version repl ans doc default

" math
syn keyword eevoFunc + - * / ^ *^ mod ! = /= < <= = > >=
syn keyword eevoFunc inc dec round truncate floor ceiling
syn keyword eevoFunc sqr cube root sqrt cbrt exp log log10 logb
syn keyword eevoFunc abs sgn max min numerator denominator dot norm
syn keyword eevoFunc sin sinh cos cosh tan tanh
syn keyword eevoFunc arcsin arcsinh arccos arccosh arctan arctanh
syn keyword eevoFunc csc csch sec sech cot coth
syn keyword eevoFunc arccsc arccsch arcsec arcsech arccot arccoth
syn keyword eevoFunc negative? positive? zero? even? odd?
syn keyword eevoFunc half double factorial gcd deg rad

" i/o
syn keyword eevoFunc read parse write print println display displayln newline printerr printerrln
syn keyword eevoNumber stdout stderr

" os
syn keyword eevoFunc cd! pwd now time

" list
syn keyword eevoFunc list list* length last nth head tail count
syn keyword eevoFunc apply map convert assoc filter keep remove memp member everyp? every?
syn keyword eevoFunc compose reverse append zip

" stack
syn keyword eevoFunc push pop peek swap

" first and rest
syn keyword eevoFunc fst rst snd ffst rfst rrst
syn keyword eevoFunc fffst ffrst frfst frrst rffst rfrst rrfst rrrst

" string
syn keyword eevoFunc strfmt split

" lambda sign
" syn match eevoSyntax /\<[\u03bb]\>/

" TODO : and [] as sym end

" TODO highlight escape sequences
syn region eevoString start='\%(\\\)\@<!"' skip='\\[\\"]' end='"' contains=@Spell

" TODO ;;; for section title
syn match eevoComment ';.*$' contains=eevoTodo,eevoNote,@Spell
syn keyword eevoTodo FIXME TODO XXX contained
syn keyword eevoNote '\CNOTE\ze:\?' contained

syn match eevoDelimiter '\<\.\>'
" syn match eevoDelimiter ':\+'

syn keyword eevoNumber e pi tau
syn match eevoNumber "\<[+-]\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([eE][-+]\=\d\+\)\=\>"
" syn match eevoNumber "[+-]\=\(\d\+/\d\+\)"
syn match eevoNumber "0[xX][0-9a-fA-F]\+"

syn match eevoSymbol ,\k+, contained

syn keyword eevoBoolean True () Nil False it

syn cluster eevoNormal  contains=eevoSyntax,eevoFunc,eevoDelimiter
syn cluster eevoQuotedStuff  contains=eevoSymbol
syn cluster eevoQuotedOrNormal  contains=eevoDelimiter

syn region eevoStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region eevoStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="]" contains=ALL
syn region eevoStruc matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALL
syn region eevoQuoted matchgroup=Delimiter start="['`]" end=![ \t()";]!me=e-1 contains=ALL

syn region eevoQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALL

syn region eevoUnquote matchgroup=Delimiter start="," end=![ \t()";]!me=e-1 contains=ALL
syn region eevoUnquote matchgroup=Delimiter start=",@" end=![ \t()";]!me=e-1 contains=ALL

syn region eevoUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region eevoUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

" Comments
syn cluster eevoNormal  add=eevoQuoted,eevoComment
syn cluster eevoQuotedOrNormal  add=eevoComment


" Synchronization and the wrapping up...
syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
hi def link eevoSyntax             Statement
hi def link eevoFunc               Function

hi def link eevoString             String
hi def link eevoChar               Character
hi def link eevoBoolean            Boolean

hi def link eevoNumber             Number
hi def link eevoNumberError        Error

hi def link eevoQuoted             Structure
hi def link eevoSymbol             Structure

hi def link eevoDelimiter          Delimiter
hi def link eevoConstant           Constant

hi def link eevoComment            Comment
hi def link eevoTodo               Todo
hi def link eevoNote               SpecialComment
hi def link eevoError              Error

let b:current_syntax = "eevo"
