" Set line number
set number 
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set mouse=a			        	" enable mouse support 
set laststatus=2                " lightdm

let mapleader="/"

syntax on
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'

" css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

" js
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'millermedeiros/vim-esformatter'
Plug 'prettier/vim-prettier'

" colorschemes
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'vim-scripts/summerfruit256.vim'
" Initialize plugin system
call plug#end()


" NERDTree settings
map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]


" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

let g:molokai_original=0
colorscheme molokai
" make 'var' keyword easier to spot
hi link javascriptType Keyword
" default ColorColumn is too distractive
hi clear ColorColumn
hi link ColorColumn FoldColumn
" defaul line number is too distractive
hi clear LineNr
hi link LineNr Comment
hi link OverLength Error

" --- UI settings ---


if has('gui_running')
    "set guifont=Menlo:h13
    set gfn:Monaco:h14
    set transp=0

    " toolbar and scrollbars
    set guioptions-=T       " remove toolbar
    set guioptions-=L       " left scroll bar
    set guioptions-=r       " right scroll bar
    set guioptions-=b       " bottom scroll bar
    set guioptions-=h      " only calculate bottom scroll size of current line
    set shortmess=atI       " Don't show the intro message at start and
                            "   truncate msgs (avoid press ENTER msgs).
endif

" solarized theme
"syntax enable
"set background=dark
"colorscheme solarized

" for commenting
" --- NERDCommenter ---

map <C-o> :call NERDComment(0,"toggle") <CR>

let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
\ }

" select all
map <C-a> <esc>ggVG<CR>
