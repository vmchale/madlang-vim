if exists("b:madlang_ftplugin")
	finish
endif
let b:madlang_ftplugin = 1

setlocal commentstring={#\ %s\ #}

set makeprg=madlang\ --input\ %

if !exists("g:madlang_options")
    let g:madlang_options = ''
endif

let g:madlang_buf_name = 'Madlang'

if !exists("g:madlang_buf_size")
    let g:madlang_buf_size = 13
endif

" indentation behavior
set smarttab
au BufNewFile,BufRead *.mad
    \ set shiftwidth=4

" Mark a buffer as scratch
function! s:ScratchMarkBuffer()
    setlocal buftype=nofile
    " make sure buffer is deleted when view is closed
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal buflisted
    setlocal nonumber
    setlocal statusline=%F
    setlocal nofoldenable
    setlocal foldcolumn=0
    setlocal wrap
    setlocal linebreak
    setlocal nolist
endfunction

" Return the number of visual lines in the buffer
fun! s:CountVisualLines()
    let initcursor = getpos(".")
    call cursor(1,1)
    let i = 0
    let previouspos = [-1,-1,-1,-1]
    " keep moving cursor down one visual line until it stops moving position
    while previouspos != getpos(".")
        let i += 1
        " store current cursor position BEFORE moving cursor
        let previouspos = getpos(".")
        normal! gj
    endwhile
    " restore cursor position
    call setpos(".", initcursor)
    return i
endfunction

" return -1 if no windows was open
"        >= 0 if cursor is now in the window
fun! s:MadlangGotoWin() "{{{
    let bufnum = bufnr( g:madlang_buf_name )
    if bufnum >= 0
        let win_num = bufwinnr( bufnum )
        " Will return negative for already deleted window
        exe win_num . "wincmd w"
        return 0
    endif
    return -1
endfunction "}}}

" Close madlang Buffer
fun! MadlangClose() "{{{
    let last_buffer = bufnr("%")
    if s:MadlangGotoWin() >= 0
        close
    endif
    let win_num = bufwinnr( last_buffer )
    " Will return negative for already deleted window
    exe win_num . "wincmd w"
endfunction "}}}

" Open a scratch buffer or reuse the previous one
fun! MadlangGet() "{{{
    let last_buffer = bufnr("%")
    let last_buffer_file = bufname("%")

    if s:MadlangGotoWin() < 0
        new
        exe 'file ' . g:madlang_buf_name
        setl modifiable
    else
        setl modifiable
        normal ggVGd
    endif

    call s:ScratchMarkBuffer()

    execute '.!madlang --input ' . last_buffer_file . g:madlang_options
    setl nomodifiable
    
    let size = s:CountVisualLines()

    if size > g:madlang_buf_size
        let size = g:madlang_buf_size
    endif

    execute 'resize ' . size

    nnoremap <silent> <buffer> q <esc>:close<cr>
    nnoremap <buffer> <F5> <esc>:close \| :Madlang<cr>

endfunction "}}}

command! Madlang call MadlangGet()
nnoremap <F5> <ESC>:Madlang<CR>
