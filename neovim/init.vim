" leader key
    let mapleader="-"
    set timeout timeoutlen=100

" Enabling plugins (vim-plug required and the path should be adapted)
    call plug#begin('~/.config/nvim/plugged')

    " Auto-completion plugin, external installation required
    Plug 'Valloric/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Haskell
    Plug 'neovimhaskell/haskell-vim'
    Plug 'owickstrom/neovim-ghci'
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

    " Better layout for writing prose
    Plug 'junegunn/goyo.vim'

    " Parentheses and brackets
    Plug 'tpope/vim-endwise'
    Plug 'rstacruz/vim-closer'

    " Latex support
    Plug 'lervag/vimtex'

    " Status bar and themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Git integration
    Plug 'tpope/vim-fugitive'

    " Quick file navigation
    Plug 'ctrlpvim/ctrlp.vim'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Sessions
    Plug 'tpope/vim-obsession'

    call plug#end()

" hard mode, disables the arrow keys in command mode
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Right> <NOP>
    noremap <Left> <NOP>

" Disables automatic commenting on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all training whitespace on save
    autocmd BufWritePre * %s/\s\+$//e

" Change cursor type for insert mode
    set guicursor=

" Copy paste from/to vim to/from clipboard with Ctrl-C/Ctrl-x
    vnoremap <C-c> "+y
    map <C-x> "+P

" Splits open at the bottom and right by default
    set splitbelow splitright

" Shortcutting split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Jump to/from files with gf/ctrl-6
    set hidden
    set path+=**

" Set spell check language
    set spelllang=en

" Make lines wrap around the screen
    set wrap
    set formatoptions=tcqrn1

" Scroll limit
    set scrolloff=5

" Line numbers appear relative to the current line
    set number relativenumber
    set nu rnu

" Highlight angled bracket pairs
    set matchpairs+=<:>

" Default utf-8
    set encoding=utf-8

" Search configurations
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

" Tab/whitespace configurations
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set nolist

" Status line basics
    set ruler laststatus=2 showcmd showmode

" Semantic folding
    set foldmethod=syntax
    set nofoldenable
    set foldlevelstart=200

" New line without leaving normal mode using <Enter>
    map <Enter> o<ESC>

" Bring back Escape to terminal mode
    tnoremap <Esc> <C-\><C-n>

" Special filetypes
    autocmd BufWinEnter *.tex set filetype=tex
    autocmd BufWinEnter .spacemacs set filetype=lisp

" Build commands for quick python and c++ scripts using Ctrl-p
    autocmd Filetype python nnoremap <C-p> :w<CR> :term python3 -i %<CR>i
    autocmd Filetype cpp nnoremap <C-p> :w<CR> :term g++ -std=c++17 -Wshadow -Wall "%" -o "%:r" -O2 -Wno-unused-result && time ./"%:r"<CR><CR>

" Status line customization with vim-airline
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#formatter='unique_tail'
    let g:airline#extensions#tabline#tab_nr_type=1
    let g:airline#extensions#branch#enabled=1
    let g:airline_section_z='%3p%%'
    let g:airline_powerline_fonts=1
    let g:airline_detect_spell=1
    let g:airline_detect_spelllang=1
    let g:airline_theme='wombat'

" Use goyo to make text more readable
    map <leader>f :Goyo\| set linebreak<CR>

" Auto-complete ycm configuration for python
    let g:ycm_python_interpreter_path='/usr/bin/python3'
    let g:ycm_python_sys_path=[]
    let g:ycm_extra_conf_vim_data=[
        \ 'g:ycm_python_interpreter_path',
        \ 'g:ycm_python_sys_path'
        \]
    let g:ycm_global_ycm_extra_conf='~/.global_extra_conf.py'
    let g:ycm_confirm_extra_conf=0

" Default pdf viewer used by vimtex
    let g:vimtex_view_general_viewer='zathura'

" Quick file navigation with ctrlp
    let g:ctrlp_map='<leader>;'

" Snippets with ultisnips
    let g:UltiSnipsExpandTrigger='<leader>e'
    let g:UltiSnipsJumpForwardTrigger='<leader>n'
    let g:UltiSnipsJumpBackwardTrigger='<leader>p'

" Haskell plugins
    let g:haskell_classic_highlighting = '1'
    let g:ghcid_keep_open = '1'

" Main
    syntax on
    filetype plugin indent on
