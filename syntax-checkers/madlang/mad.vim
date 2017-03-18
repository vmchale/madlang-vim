if exists('g:loaded_syntastic_madlang_mad_checker')
    finish
endif
let g:loaded_syntastic_madlang_mad_checker = 1

function! SyntaxCheckers_madlang_mri_GetLocList() dict
    let makeprg = "madlang lint %  " 
                "self.makeprgBuild({
                " \ 'args': '-w -T1',
                " \ 'args_after': '-c' })

    " filter out lines starting with ...
    " long lines are truncated and wrapped in ... %p then returns the wrong
    " column offset
    let errorformat =
                \ '%INo errors found\.'
                "\ '%-GNo errors found,' .
                \ '%E: ParseError %m,' . " fix this
               " \ '%W%f:%l: warning: %m,' .
               " \ '%Z%p^,' .
               " \ '%W%f:%l: %m,' .
               " \ '%-C%.%#'

    let env = { 'madlangOPT': '' }

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'madlang',
    \ 'name': 'mad'})
