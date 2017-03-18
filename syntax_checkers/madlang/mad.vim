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
                \ '%EParseError %m,' .
                \ '%Z' 
                \ "%ESemantic Error %m," .
                \ '%Z' 


    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

function! MadlangCheck()
    execute 'SyntasticCheck \| Error'
endfunction

autocmd BufWritePost *.mad call MadLangCheck()

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'madlang',
    \ 'name': 'mad'})
