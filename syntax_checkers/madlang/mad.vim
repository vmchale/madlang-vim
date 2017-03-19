if exists('g:loaded_syntastic_madlang_mad_checker')
    finish
endif
let g:loaded_syntastic_madlang_mad_checker = 1

let g:syntastic_madlang_mad_exec = 'madlang'

function! SyntaxCheckers_madlang_mad_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ 'exe': self.getExec(),
                \ 'args': 'lint',
                \ 'fname': shellescape(expand('%'))})
    " TODO figure out if this is screwing things up/what is being executed

    let errorformat =
                \ '%INo errors found.,' .
                \ '%Z,' .
                \ '%E%f:%l:%c:,' .
                \ '%C%m,' .
                \ '%C%m,' .
                \ '%Z,' .
                \ '%EParseError %m,' .
                \ '%Z,' .
                \ '%E  Semantic Error: %m,' .
                \ '%C%m,' .
                \ '%Z' 

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

" Commmand to check
command! MadlangCheck SyntasticCheck | Error
" lint automatically
" autocmd BufWritePost *.mad MadlangCheck

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'madlang',
    \ 'name': 'mad'})
