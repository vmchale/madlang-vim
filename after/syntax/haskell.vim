" Vim syntax file
" Language: haskell with embedded madlang
" Author:   Vanessa McHale <vanessa.mchale@reconfigure.io>
" License:  BSD3

" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @madlang syntax/madlang.vim
unlet b:current_syntax

syn region madBlock   matchgroup=quasiQuote start=/\[\$\?madlang|/       end=/|\]/ contains=@madlang

command! -nargs=+ HiLink hi def link <args>

hi def link quasiQuote Underlined

delcommand HiLink

" restore current syntax value
let b:current_syntax = old_syntax
