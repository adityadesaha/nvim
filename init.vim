call plug#begin( '~/.config/nvim/plugged' ) "{{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'scrooloose/nerdtree'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'andreypopp/vim-colors-plain'
    Plug 'vimwiki/vimwiki'
    Plug 'dermusikman/sonicpi.vim'
    Plug 'Shougo/vimproc.vim'
    Plug 'wilsaj/chuck.vim'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
    Plug 'Raimondi/delimitMate'
    Plug 'moll/vim-bbye'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'Mizux/vim-colorschemes'
    "Plug 'tmhedberg/SimpylFold'
    Plug 'tpope/vim-commentary'
    Plug 'lervag/vimtex'
    Plug '907th/vim-auto-save'
call plug#end() "}}}

"{{{ vim settings

    " numbers:
    set number
    set relativenumber

    " colorcolumns
    set textwidth=80
    set colorcolumn=+1

    " auto-save
    let g:auto_save=0

    " latex
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_mode=2
    let g:vimtex_fold_enabled=1
    set conceallevel=1
    let g:tex_conceal='abdmgs'

    " ranger
    let g:ranger_map_keys = 0

    " folding:
    set foldlevel=1
    set foldmethod=marker
    set foldtext=MyFoldText()

    " tabs/indenting:
    set tabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set autoindent

    " search:
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set showmatch
    set matchtime=1

    " tabline
    set tabline=%!MyTabLine()

    " wrapping
    set nowrap
    set linebreak
    set cursorline
    set title
    set fillchars+=fold:\ 
    set listchars=trail:_,extends:>,tab:\┊\ 
    set list

    " mouse
    set mouse=a

    " scrolling
    set scrolloff=8
    set sidescrolloff=5

    " new windows split better
    set splitright
    set splitbelow

    " allow buffers to be hidden without saving
    set hidden

    " misc
    set wildchar=<tab>
    set wildcharm=<C-z>
    set wildmenu
    set wildmode=full

    " For markdown texts
    set conceallevel=0
    let g:vim_markdown_folding_disabled = 1

    " For markdown-preview
    let g:mkdp_page_title = "${name}"
    let g:mkdp_command_for_global = 1
    let g:mkdp_browser = "surf"

    " For vimwiki
    let g:vimwiki_list = [{
                \ 'path': '~/wiki',
                \ 'path_html': '~/wiki_html',
                \ 'syntax': 'markdown',
                \ 'ext': '.md',
                \ }]

    " For UltiSnips
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    " for auto-save
    let g:auto_save=0
    let g:auto_save_silent=1

    " keymap to save the document in insert mode
    inoremap <C-s> <esc>:w<cr>a

    " for indentline
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    " for chuck
    let g:chuck_command = "chuck -p1234"

    " for ycm
    let g:ycm_clangd_binary_path = "/usr/bin/clangd"
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_key_list_select_completion = ["<C-n>"]
    let g:ycm_key_list_previous_completion = ["<C-p>"]
    "set completeopt-=preview
    let g:ycm_error_symbol = '●'
    let g:ycm_warning_symbol = '●'

"}}}
"{{{ keybindings
    let mapleader=" "

    " youcompleteme bindings
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
    nnoremap <leader>gi :YcmCompleter GoToDefinition<cr>
    nnoremap <leader>gf :YcmCompleter GoToInclude<cr>
    nnoremap <leader>gg :YcmCompleter GetDoc<cr>

    " in normal mode, press
    " <esc> to clear the previous
    " search highlighting
    nnoremap <esc> :nohl<cr>

    " uppercase the word under cursor
    inoremap <C-u> <Esc>gUiw`]a

    " mapping for ranger
    nnoremap <leader>a :Ranger<cr>

    " delete buffer
    nnoremap <leader>x :Bdelete<cr>

    " IDK if this is gonna work
    nnoremap ; :
    nnoremap : ;

    " going through the errors
    nnoremap <leader>n :cnext<cr>
    nnoremap <leader>p :cNext<cr>

    " cycling b/w tabs and buffers
    nnoremap <expr> J len(gettabinfo()) > 1 ? 'gT' : ':bN<cr>'
    nnoremap <expr> K len(gettabinfo()) > 1 ? 'gt' : ':bn<cr>'

    " removing a buffer intelligently
    nnoremap <leader>x :Bdelete<cr>

    " goyo
    nnoremap <leader>go :Goyo<cr>

    " clear search highlighting
    nnoremap <leader>nh :nohl<cr>

    " reloading config file
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>ev :edit $MYVIMRC<cr>
    nnoremap <leader>s <nop>

    "{{{ movement keys
        " NOTE that these keys are probably overridden by
        " the plugin vim-tmux-navigator.
        "nnoremap <C-h> <C-w>h
        "nnoremap <C-j> <C-w>j
        "nnoremap <C-k> <C-w>k
        "nnoremap <C-l> <C-w>l

        "inoremap <C-h> <esc><C-w>h
        "inoremap <C-j> <esc><C-w>j
        "inoremap <C-k> <esc><C-w>k
        "inoremap <C-l> <esc><C-w>l

        "tnoremap <C-h> <C-\><C-n><C-w>h
        "tnoremap <C-j> <C-\><C-n><C-w>j
        "tnoremap <C-k> <C-\><C-n><C-w>k
        "tnoremap <C-l> <C-\><C-n><C-w>l

        " Easy navigation across wrapped lines
        nnoremap j gj
        nnoremap k gk
    "}}}

    " arrow keys are used to resize panes in normal mode
    nnoremap <Up> :resize +2<cr>
    nnoremap <Down> :resize -2<cr>
    nnoremap <Left> :vertical resize -2<cr>
    nnoremap <Right> :vertical resize +2<cr>

    " easier fold/unfold
    nnoremap <tab> za
    nnoremap <S-tab> zA
    " fzf bindings
    nnoremap <leader>f :FZF ~<CR>
    nnoremap <leader>F :FZF<CR>
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader>h :Helptags<cr>

    " closing braces
    "inoremap {<cr> {<cr>}<esc>O

    " NERDTree
    nnoremap <leader>nt :NERDTreeToggle<cr>

    " markdown
    nnoremap <leader>md :MarkdownPreview<cr>

    " vimwiki
    let g:vimwiki_list = [{ 'path': '~/vimwiki',
                          \ 'syntax': 'markdown',
                          \ 'ext': '.md' }]

    " shows the highlight group of the word under the cursor
    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"}}}
"{{{ appearance

    syntax on
    colorscheme default

    hi   htmlBold      cterm=bold     ctermbg=none   ctermfg=none
    hi   htmlItalic    cterm=italic   ctermbg=none   ctermfg=none

    " YCM Highlight Groups
    hi YcmErrorSign cterm=none ctermbg=0 ctermfg=3
    hi YcmErrorSection cterm=underline,italic ctermfg=3
    hi YcmWarningSign cterm=none ctermbg=0 ctermfg=10
    hi YcmWarningSection cterm=underline,italic

    " End of Buffer, don't display the annoying ~s
    hi  EndOfBuffer  ctermfg=0

    " Text concealing
    hi Conceal ctermbg=none

    " Color column to highlight 80 chars
    hi ColorColumn ctermbg=0

    hi MatchParen cterm=bold ctermbg=none ctermfg=none

    hi VertSplit cterm=none ctermbg=0 ctermfg=0

    hi Folded cterm=italic ctermbg=0
    hi Comment cterm=italic

    hi LineNr ctermbg=0
    hi CursorLineNr ctermbg=0
    hi CursorLine cterm=none ctermbg=0

    hi Search cterm=none ctermbg=0 ctermfg=15
    hi SignColumn ctermbg=0



    " Statusline {{{

    hi StatusLine cterm=none ctermbg=6 ctermfg=0
    hi StatusLineNC cterm=none ctermbg=0

    set statusline=%!MyStatusLine() " defined in plugins/statusline.txt

    "set statusline=\ 
    "set statusline+=%t
    "set statusline+=\ %r
    "set statusline+=%m
    "set statusline+=\ 
    "set statusline+=%{buftabs#statusline()}
    "set statusline+=%=
    "set statusline+=%y\ 
    "set statusline+=%l:%c,%p%%\ 

    "}}}

    hi TabLine cterm=none ctermbg=0 ctermfg=7
    hi TabLineFill cterm=none ctermbg=0
    hi TabLineSel cterm=none ctermbg=3 ctermfg=0

"}}}
"{{{ behaviour

    augroup quickfix_commands
        autocmd!
        " Automatically open, but do not go to (if there are errors) the quickfix /
        " location list window, or close it when is has become empty.
        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost    l* nested lwindow
    augroup END

    augroup vim_resize
        autocmd!
        autocmd VimResized * :wincmd =
    augroup END

    augroup cursorlines
        autocmd!
        autocmd InsertEnter,WinLeave,FocusLost * set nocursorline
        autocmd InsertLeave,WinEnter,FocusGained * set cursorline
    augroup END

    "augroup statuslines
    "    autocmd!
    "    autocmd WinEnter,FocusGained * setlocal statusline=%!MyStatusLine(1)
    "    autocmd WinLeave,FocusLost * setlocal statusline=%!MyStatusLine(2)
    "augroup END

    augroup auto-mkdir
        autocmd!
        function! s:auto_mkdir(dir, force)
            if !isdirectory(a:dir)
                        \ && (a:force
                        \ || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
                call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
            endif
        endfunction
        autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    augroup end

"}}}
"{{{ file-specific options

    augroup post_vimrc
        autocmd!
        autocmd BufWritePost init.vim :source $MYVIMRC
    augroup END

    augroup vimwiki_useless_stuff
        autocmd!
        autocmd FileType vimwiki :set ft=markdown
    augroup END

    augroup post_xresources
        autocmd!
        autocmd BufWritePost .Xresources :!xrdb ~/.Xresources
    augroup END

    augroup rmd
        autocmd!
        autocmd FileType rmd noremap <F5> :w<cr>:!Rscript -e 'rmarkdown::render("%")'<cr>
    augroup END

"}}}
"{{{ Gui specific settings
    if exists('g:GuiLoaded')
        Guifont Inconsolata\ for\ Powerline:h14
        GuiTabline 1
        colorscheme pencil
        set background=light
    endif
"}}}
