" Language:   Madlibs
" Maintainer: Vanessa McHale <tmchale@wisc.edu>
" URL:        https://github.com/vmchale/madlang-vim
" LICENSE:    BSD3

if exists("b:current_syntax")
  finish
endif

"syn match tomlEscape /\\U\x\{8}/ contained
"hi def link tomlEscape SpecialChar

" Literal strings
syn region madString oneline start=/"/ end=/"/
hi def link madString String

"syn match tomlInteger /\<[+-]\=[0-9]\(_\=\d\)*\>/ display
"hi def link tomlInteger Number

"Floats
syn match madFloat /\<[+-]\=[0-9]\(_\=\d\)*\.\d\+\>/ display
syn match madFloat /\<[+-]\=[0-9]\(_\=\d\)*\(\.[0-9]\(_\=\d\)*\)\=[eE][+-]\=[0-9]\(_\=\d\)*\>/ display
hi def link madFloat Float

"Keywords
syn region madKeyword oneline start=/:/ end=/\ /
hi def link madKeyword Identifier

"Comments
syn match madComment /#.*/ contains=@Spell
syn region madComment start=/{#/ end=/#}/
hi def link madComment Comment

let b:current_syntax = "madlang"
