
filetype off
execute pathogen#infect()
execute pathogen#helptags()

filetype on
filetype plugin on
filetype indent on

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

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ch=2
set vb
set hidden
set laststatus=2
set lazyredraw
set showmode
set virtualedit=all
set autoread
" set relativenumber
set number

set nobackup
set noswapfile

let mapleader = ","

nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>


