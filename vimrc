
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
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'guns/vim-sexp'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-classpath.git'
Plugin 'guns/vim-clojure-static.git'
Plugin 'guns/vim-clojure-highlight.git'
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
Plugin 'powerman/asciidoc', {'rtp': 'vim'}
Plugin 'xoria256.vim'
Plugin 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}
Plugin 'chrisbra/csv.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'bufkill.vim'
Plugin 'rizzatti/dash.vim'

" Erlang Support
Plugin 'jimenezrick/vimerl'

" Elixir Support
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

source $VIMRUNTIME/macros/matchit.vim 

filetype plugin indent on

" Force my gvim on windoze into english 
set langmenu=en_US.UTF-8
let $LANG='en'
set encoding=utf-8

if has('win32')
    set guifont=Powerline_Consolas:h11:cANSI
elseif has('gui_macvim')
    set guifont=Powerline\ Consolas:h14
    set shell=/bin/bash\ -l
endif

set ttimeoutlen=100

set omnifunc=syntaxcomplete#Complete

" Enable Airline with tabline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#eclim#enabled = 1 

set guioptions+=c
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set t_Co=256

" other schemes: xoria256, Tomorrow-Night
" colorscheme xoria256
colorscheme Tomorrow-Night
set background=dark
" colorscheme solarized

" highlight Search guibg=purple guifg=NONE

syntax on

" relativenumber is confusing to me
set relativenumber " centers '0' at cursor 
" set number " show linenumbers

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
" let loaded_delimitMate=1

let g:paredit_smartjump=1

let mapleader = ","

nnoremap <silent> <F8> gg"+yG 

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>/ :nohlsearch<CR>

" NERDTree Bindings
nnoremap <silent> <leader>tt :NERDTreeToggle<CR>
nnoremap <silent> <leader>tf :NERDTreeFind<CR>

" CtrlP Bindings
let g:ctrlp_open_new_file = 'r'
nmap <leader>fb :CtrlPBuffer<cr>
nmap <leader>ff :CtrlP .<cr>
nmap <leader>fF :execute ":CtrlP " . expand('%:p:h')<cr>
nmap <leader>fr :CtrlP<cr>
nmap <leader>fm :CtrlPMixed<cr>
nmap <leader>ft :CtrlPTag<cr>

" Fugitive bindings
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gb :Gblame<cr>

" Tagbar
nnoremap <silent> <leader>b :TagbarToggle<cr>

cmap w!! w !sudo tee > /dev/null %

inoremap <silent> <C-L> <ESC>A

" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

nmap <silent> <leader>vm V]M

" Dash Integration
nmap <silent> <leader>K <Plug>DashSearch
nmap <silent> <leader>gK <Plug>DashGlobalSearch

" Custom file extensions
augroup custom_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    autocmd BufRead,BufNewFile *.ad,*.adoc set filetype=asciidoc
    
    autocmd FileType yaml setlocal sw=2 sts=2 et
    autocmd FileType ruby setlocal sw=2 sts=2 et
    autocmd FileType asciidoc setlocal textwidth=80
    autocmd filetype crontab setlocal nobackup nowritebackup
    autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup end

command! -nargs=0 FormatJson :%! jq '.' -a

highlight Cursor guibg=orange guifg=black

nnoremap <silent> <leader>w :bp \|sp \|bn \|bd <CR>

" Try changing cursor in terminal mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if exists('$ITERM_PROFILE')
    " Insert mode
    " use vertical line
    let &t_SI = "\033[6 q"
    " Other
    " solid block
    let &t_EI = "\033[2 q"

    let leave_command = "\033[0 g"

    if exists('$TMUX')
        let &t_SI = "\033Ptmux;\033" . &t_SI . "\033\\"
        let &t_EI = "\033Ptmux;\033" . &t_EI . "\033\\"
        let leave_command = "\033Ptmux;\033" . leave_command . "\033\\" 
    endif

    " reset cursor when vim exits
    execute ("autocmd VimLeave * silent !echo -ne " . leave_command)
endif


