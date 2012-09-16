" Forget being compatible with good ol' vi
set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" set runtimepath+=$HOME/.vim/vim-haml

" Colors
colorscheme ir_black

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" cursor modification
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" 2 space tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Turn on that syntax highlighting
set hlsearch
set incsearch
set number
set ruler

" Why is this not a default
set hidden
set vb t_vb =
set ts=2 sts=2 sw=2 expandtab

" Emulate Textmate shift left/right key commands for indenting
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv  

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
        
  " Restore cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
endif

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif
