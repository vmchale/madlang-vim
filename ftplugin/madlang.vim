if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

setlocal commentstring={#\ %s\ #}

set makeprg=madlibs\ --input\ %

set syntax=madlang
