
filetype off
execute pathogen#infect()
execute pathogen#helptags()

filetype on
filetype plugin on
filetype indent on

" GUI / Look & Feel
set langmenu=en_US.UTF-8
let $LANG='en'

set guifont=Consolas:h11:cANSI
set guioptions+=c
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

colorscheme xoria256

syntax on

" set relativenumber " centers '0' at cursor 
set number " show linenumbers

set hidden
set laststatus=2
set lazyredraw
set showmode
set title
set noerrorbells

" Editor behaviour
set autoread
set nobackup
set noswapfile

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" Editing
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set copyindent
set smarttab    " indent using shiftwidth not tabstop

" Search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap <silent> ,/ :nohlsearch<CR>

set ch=2
set vb
set virtualedit=all

let mapleader = ","

nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
nmap <silent> ,t :NERDTreeToggle<CR>

