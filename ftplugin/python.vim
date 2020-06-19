compiler pyunit
setlocal makeprg=python\ %
nnoremap <leader>r :w<cr>:silent !tmux new-window "python % ; read"<cr><cr>
nnoremap H :silent !tmux new-window "pydoc " . expand("<cword>")<cr>

iabbrev """<cr> """<cr>"""<esc>O
