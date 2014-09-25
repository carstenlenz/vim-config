
set nocompatible  

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim.git'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/paredit.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-classpath.git'
Plugin 'guns/vim-clojure-static.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-leiningen.git'
Plugin 'tpope/vim-projectionist.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'garbas/vim-snipmate.git'
Plugin 'honza/vim-snippets.git'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-surround'
Plugin 'dagwieers/asciidoc-vim'
Plugin 'xoria256.vim'
Plugin 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}

call vundle#end()
" execute pathogen#infect()
" execute pathogen#helptags()

filetype plugin indent on

" Force my gvim on windoze into english 
set langmenu=en_US.UTF-8
let $LANG='en'
set encoding=utf-8

if has('win32')
"    set guifont=Consolas:h11:cANSI
    set guifont=Powerline_Consolas:h11:cANSI
elseif has('gui_macvim')
"    set guifont=Consolas:h14
"    set guifont=Anonymous\ Pro\ for\ Powerline:h15
    set guifont=Powerline\ Consolas:h14
endif

"
set omnifunc=syntaxcomplete#Complete

" Enable Airline with tabline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1

set guioptions+=c
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set t_Co=256

" other schemes: xoria256, Tomorrow-Night
colorscheme Tomorrow-Night
" set background=dark
" colorscheme solarized

syntax on

" relativenumber is confusing to me
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

set ch=2
set vb
set virtualedit=all

" Plugin Options
let delimitMate_expand_cr=1
let loaded_delimitMate=1

let g:paredit_smartjump=1

let mapleader = ","

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

inoremap <silent> <C-L> <ESC>A

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

" Custom file extensions
au BufRead,BufNewFile *.gradle set filetype=groovy
au FileType yaml setlocal sw=2 sts=2 et
au FileType ruby setlocal sw=2 sts=2 et
au BufRead,BufNewFile *.ad set filetype=asciidoc
au FileType asciidoc setlocal textwidth=80

nnoremap <silent> <leader>w :bp \|sp \|bn \|bd <CR>

" au InsertLeave * hi Cursor guibg=red
" au InsertEnter * hi Cursor guibg=green
highlight Cursor guibg=orange guifg=black
highlight Search guibg=purple guifg=NONE
