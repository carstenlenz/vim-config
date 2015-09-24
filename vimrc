
set nocompatible  
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim.git'
Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'bling/vim-airline'
" This makes my vim slooow
" Plugin 'tpope/vim-classpath.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-projectionist.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'garbas/vim-snipmate.git'
Plugin 'honza/vim-snippets.git'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-surround'
Plugin 'chrisbra/csv.vim'
Plugin 'bufkill.vim'
Plugin 'tpope/vim-sleuth'
" Setting a whole lot of useful defaults...
Plugin 'tpope/vim-sensible'

" Color schemes
Plugin 'xoria256.vim'
Plugin 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" Languages
Plugin 'derekwyatt/vim-scala'
Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'guns/vim-clojure-static.git'
Plugin 'guns/vim-clojure-highlight.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'powerman/asciidoc', {'rtp': 'vim'}

" Tools
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen.git'
Plugin 'mattn/gist-vim'
Plugin 'rizzatti/dash.vim'

call vundle#end()

source $VIMRUNTIME/macros/matchit.vim 

if has('gui_macvim')
    set guifont=Hack:h14
    set shell=/bin/bash\ -l
    set guioptions+=c
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif

set omnifunc=syntaxcomplete#Complete

" Enable Airline with tabline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#eclim#enabled = 1 

" Terminal colors
set t_Co=256

" set background=light
set background=dark
" other schemes: xoria256, Tomorrow-Night
" colorscheme xoria256
" colorscheme Tomorrow-Night
" colorscheme solarized
colorscheme molokai

" highlight Search guibg=purple guifg=NONE

set relativenumber " centers '0' at cursor 
" set number " show linenumbers
set showmode
set title
set cmdheight=2

" Editor behaviour

" Makes buffers hidden when opening new buffers instead of closing them
set hidden 
set nobackup
set noswapfile

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" Editing
set tabstop=4
set shiftwidth=4
" Use shiftwidth for indentation with '>' and '<"
set shiftround
" Tabs to spaces
set expandtab
set copyindent
set virtualedit=all

" Search
set showmatch
set ignorecase
set smartcase

set visualbell

" Plugin Options
let delimitMate_expand_cr=1
" let loaded_delimitMate=1

let g:paredit_smartjump=1

let mapleader = "\<Space>"

nnoremap <silent> <F8> gg"+yG 

" nnoremap <silent> <leader>
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vS :so $MYVIMRC<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>/ :nohlsearch<CR>

" NERDTree Bindings
nnoremap <silent> <leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <leader>pt :NERDTreeFind<CR>

" CtrlP Bindings
" ==============

" open new files in current window
let g:ctrlp_open_new_file = 'r'
" List of buffers
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>ff :CtrlP .<cr>
nmap <leader>fF :execute ":CtrlP " . expand('%:p:h')<cr>
nmap <leader>pf :CtrlP<cr>
nmap <leader>fm :CtrlPMixed<cr>
nmap <leader>ft :CtrlPTag<cr>

" Fugitive bindings
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gb :Gblame<cr>

" Tagbar
nnoremap <silent> <leader>bt :TagbarToggle<cr>

cmap w!! w !sudo tee > /dev/null %

" in insert mode: create new line under current and switch to it
inoremap <silent> <C-L> <ESC>A

" Visually mark current method/function
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


