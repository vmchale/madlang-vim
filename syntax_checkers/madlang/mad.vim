if exists('g:loaded_syntastic_madlang_mad_checker')
    finish
endif
let g:loaded_syntastic_madlang_mad_checker = 1

let g:syntastic_madlang_mad_exec = "madlang"

function! SyntaxCheckers_madlang_mad_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ "exe": self.getExec(),
                \ "args": "lint",
                \ "fname": shellescape(expand("%",1))})

    " filter out lines starting with ...
    " long lines are truncated and wrapped in ... %p then returns the wrong
    " column offset
    let errorformat =
                \ '%INo errors found %m,' .
                \ '%Z,' .
                \ '%EParseError %m,' . " fix this
                \ '%Z' 

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'madlang',
    \ 'name': 'mad'})
