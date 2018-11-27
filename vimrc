
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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

Plugin 'tpope/vim-unimpaired.git'

" Provides :BUN :BD :BW that leaves windows intact
Plugin 'qpkorr/vim-bufkill'

Plugin 'tpope/vim-sleuth'

" Setting a whole lot of useful defaults...
Plugin 'tpope/vim-sensible'

" Support Emacs bindings in insert mode
Plugin 'maxbrunsfeld/vim-emacs-bindings'

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
Plugin 'fatih/vim-go'

" Tools
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen.git'
Plugin 'mattn/gist-vim'
Plugin 'rizzatti/dash.vim'
Plugin 'rodjek/vim-puppet.git'
" Plugin 'ensime/ensime-vim'

call vundle#end()

source $VIMRUNTIME/macros/matchit.vim 

if has('gui_macvim')
    set guifont=Hack:h14
    " set guifont=Powerline\ Consolas:h14
    " set shell=/bin/bash\ -l
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
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" Terminal colors
set t_Co=256

if has('gui_running')
    " set background=light
    set background=dark
    " colorscheme xoria256
    " colorscheme Tomorrow-Night
    colorscheme solarized
    " colorscheme molokai
else
    " let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
    " colorscheme Tomorrow-Night
    " colorscheme xoria256
endif

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
" ==============

let delimitMate_expand_cr=0
" let loaded_delimitMate=1

let g:ctrlp_open_new_file = 'r'  " open new files in current window

let g:paredit_smartjump=1

let g:syntastic_puppet_checkers = ['puppetlint']
let g:syntastic_puppet_puppetlint_args = "--no-80chars-check --no-class_inherits_from_params_class-check --no-selector_inside_resource-check --no-variable_scope-check --no-puppet_url_without_modules-check"

let g:BufKillCreateMappings=0


" Bindings - sorted by group
" ==========================

let mapleader = "\<Space>"

" Buffer bindings - prefix 'b'
" ----------------------------

" bb - List of buffers
nmap <leader>bl :CtrlPBuffer<cr>                

" bt - open list of tags of current buffer
nnoremap <silent> <leader>bt :TagbarToggle<cr>  

" delete buffer and keep window
nnoremap <silent> <leader>bd :BD<cr>

" delete buffer and close window
nnoremap <silent> <leader>bD :bd<cr>

" go to next buffer
nnoremap <silent> <leader>bf :BF<cr>

" go to previous buffer
nnoremap <silent> <leader>bb :BB<cr>


" File bindings - prefix 'f'
" --------------------------
" Toggle NERDTree from project root
nnoremap <silent> <leader>ft :NERDTreeToggle<CR>            

" Find file in current working dir
nmap <leader>ff :CtrlP .<cr>                                

" Find file in current file's directory
nmap <leader>fF :execute ":CtrlP " . expand('%:p:h')<cr>    

" Find files and buffers (mixed mode)
nmap <leader>fm :CtrlPMixed<cr>                             


" Project bindings - prefix 'p'
" -----------------------------
" Find file in project (from basedir)
nmap <leader>pf :CtrlP<cr>                      

" Toggle NERDTree and locate current file
nnoremap <silent> <leader>pt :NERDTreeFind<CR>  


" VIM bindings - prefix 'v'
" -------------------------
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vS :so $MYVIMRC<CR>

" Git / Fugitive bindings
" -----------------------
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gd :Gdiff<cr>
nmap <silent> <leader>gb :Gblame<cr>

" Dash Integration - prefix 'k'
" -----------------------------
nmap <silent> <leader>kk <Plug>DashSearch
nmap <silent> <leader>kK <Plug>DashGlobalSearch

" Other bindings without group
" ----------------------------
nnoremap <silent> <F8> gg"+yG 
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

nmap <silent> <leader>vm V]M " Visually mark current method/function

cmap w!! w !sudo tee >/dev/null %

" in insert mode: create new line under current and switch to it
inoremap <silent> <C-L> <ESC>A

"" Fold Asciidoc files at sections and using nested folds for subsections
" compute the folding level
function! AsciidocLevel()
    if getline(v:lnum) =~ '^== .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^=== .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^==== .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^===== .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^====== .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^======= .*$'
        return ">6"
    endif
    return "="
endfunction
" TODO following does not work as folding is lost up reloading
" autocmd Syntax asciidoc normal zR


" Custom file extensions
augroup custom_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    autocmd BufRead,BufNewFile *.ad,*.adoc set filetype=asciidoc

    " run the folding level method when asciidoc is here
    autocmd Syntax asciidoc setlocal foldexpr=AsciidocLevel()
    " enable folding method: expression on asciidoc
    autocmd Syntax asciidoc setlocal foldmethod=expr
    " start with text unfolded all the way
    autocmd BufRead *.ad,*.adoc normal zR
    
    autocmd FileType yaml setlocal sw=2 sts=2 et
    autocmd FileType ruby setlocal sw=2 sts=2 et
    autocmd FileType asciidoc setlocal textwidth=80
    autocmd filetype crontab setlocal nobackup nowritebackup
    autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
    autocmd FileType json setlocal equalprg=jq\ '.'
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


