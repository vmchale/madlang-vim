" License: BSD3
" Author: Vanessa McHale
" Maintainer: Vanessa McHale <vanessa.mchale@reconfigure.io>

if exists('b:madlang_plugin')
	finish
endif
let b:madlang_plugin = 1

augroup madlang
    exec "autocmd BufWritePre *.mad execute 'lcd %:p:h'"
    exec 'autocmd BufWritePost *.mad MadlangCheck'
    exec 'command! MadlangCheck SyntasticCheck | Error'
augroup END
