" cursorline
autocmd! BufEnter * call ToggleCursorLine()
function! ToggleCursorLine()
    if (bufname("%") =~ "NvimTree")
        setlocal cursorline
    else
        setlocal nocursorline
    endif
endfunction
