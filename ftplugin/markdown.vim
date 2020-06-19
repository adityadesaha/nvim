nnoremap <cr> 0f(l:e %:p:h/<cfile><cr>
nnoremap <bsp> <c-^>

nnoremap <leader>r :w<cr>:!Rscript -e 'rmarkdown::render("%")'<enter>

setlocal wrap linebreak
