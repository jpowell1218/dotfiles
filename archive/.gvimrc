" Forget being compatible with good ol' vi
set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()

" syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab


" Set Colorscheme
colorscheme ir_black

" Turn on NERDTree by default
" au VimEnter *  NERDTree

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
set autochdir
set wildmode=list:longest

highlight Cursor guifg=white guibg=blue
highlight iCursor guifg=red guibg=steelblue
set guicursor=n-v-c-i:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

" 2 space tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Turn on that syntax highlighting
syntax on
set hlsearch
set incsearch
set number
set ruler

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Setup formatting for my custom _jeff.task
syntax on
filetype on
au BufNewFile,BufRead *.tasks set filetype=ruby


" Enable enhaniced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

vmap <Tab> >gv
vmap <S-Tab> <gv

imap <S-Tab> <C-P>
" imap <Tab> <C-N>
