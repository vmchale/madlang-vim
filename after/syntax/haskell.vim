" Vim syntax file
" Language: haskell with embedded madlang
" Author:   Vanessa McHale <vanessa.mchale@reconfigure.io>
" License:  BSD3

" store and remove current syntax value
let old_syntax = b:current_syntax
unlet b:current_syntax

syn include @madlang syntax/madlang.vim
unlet b:current_syntax

syn region madBlock   matchgroup=quasiQuote start=/\[\$\?madlang|/       end=/|\]/ contains=@hamlet

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

HiLink quasiQuote     Boolean
HiLink txtBlock       String
HiLink txtInterp      Normal
HiLink txtInterpDelim Delimiter
HiLink txtOp          Operator
HiLink txtString      String
HiLink txtNum         Number

delcommand HiLink

" restore current syntax value
let b:current_syntax = old_syntax
