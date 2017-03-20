" Language:   Madlibs
" Maintainer: Vanessa McHale <tmchale@wisc.edu>
" URL:        https://github.com/vmchale/madlang-vim
" LICENSE:    BSD3

if exists("b:current_syntax")
  finish
endif

" Literal strings
syn region madString oneline start=+"+ end=+"+
hi def link madString String

"Floats
syn match madFloat /\<[+]\=[0-9]\(_\=\d\)*\.\d\+\>/ display " TODO should include tibetan numerals? 
hi def link madFloat Float

"Function references
syn match madFuncName "[a-z]"
syn region madFuncRef start="efine " end=" " contains=madFuncName
hi def link madFuncRef Define

"Keywords
syn region madKeyword oneline start=/:/ end=/\ /
syn region madKeyword oneline start=/:/ end=/return/
hi def link madKeyword Label
" or highlight as an Identifier?

"Variables
syn region madKeyword oneline start=/\$/ end=/\ /
hi def link madKeyword Identifier

"Comments
syn match madComment /#.*/ contains=@Spell
syn region madComment start=/{#/ end=/#}/
hi def link madComment Comment

let b:current_syntax = "madlang"
