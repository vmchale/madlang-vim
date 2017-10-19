" Language:   Madlibs
" Maintainer: Vanessa McHale <tmchale@wisc.edu>
" URL:        https://github.com/vmchale/madlang-vim
" LICENSE:    BSD3

if exists('b:current_syntax')
  finish
endif

" Literal strings
syn region madString oneline start=+"+ end=+"+
hi def link madString String

"Floats
syn match madFloat /\<[+]\=[0-9]\(_\=\d\)*\.\d\+\>/ display " TODO should include tibetan numerals? 
hi def link madFloat Float

"Function references
syn match madFuncName "[a-z\-]"
syn region madFuncRef start="efine " end=" " contains=madFuncName
hi def link madFuncRef Define

"Keywords
syn region madKeyword oneline start=/:/ end=/\ /
syn region madKeyword oneline start=/:/ end=/return/
hi def link madKeyword Label
" or highlight as an Identifier?

"Modifiers
syn region madModifier oneline start=+\.\|to_+ end=+\ \|\n+
hi def link madModifier Identifier
" TODO fix this/use parens or something

"Inclusions
syn region madInclusion oneline start=/:/ end=/\.mad/
hi def link madInclusion Underlined

"Variables 
" TODO figure out the regex
syn region madVariable oneline start=/\$/ end=/\ \|\n\|\./
hi def link madVariable Identifier

"Comments
syn match madComment /#.*/ contains=@Spell
syn region madComment start=/{#/ end=/#}/
hi def link madComment Comment

" Special symbols
syn match madBullet '\v\|'
hi def link madBullet Special

let b:current_syntax = 'madlang'
