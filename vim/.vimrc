"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Magnus Hansson
" Last change: 2020-03-20
"
" Sections:
"    -> Set keys
"    -> Plugins
"    -> Airline
"    -> General
"    -> Split, status line, buffer, tab
"    -> Backup and files
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Spell check
"    -> Edit mappings
"    -> Snippets
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim documentation at, :help

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set map leader to space
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin manager "vim-plug"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins. Run :PlugInstall to install.
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'shime/vim-livedown'
Plug 'vim-syntastic/syntastic'
call plug#end()

" Settings Goyo
map <leader>f :Goyo<CR>
let g:goyo_width = 100

" Deactive Syntastic for tex files
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

" Settings Syntastic with Airline
let g:airline#extensions#syntastic#enable = 1
let airline#extension#syntastic#error_synbol = 'E:'
let airline#extension#syntastic#warning_symbol = 'W:'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Airline plugin to use Powerline symbols
let g:airline_powerline_fonts=1

" Set Airline to display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Enable spell detection
let g:airline_detect_spell=1

" Airline displays the Nerdtree
let g:airline#extensions#nerdtree_status=1

"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1

" Airline theme
"let g:airline_theme='solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree, :help NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>t :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable unicode
set encoding=utf-8

" Always show current position
set ruler

" Line numbers
set number relativenumber

" Line wrap (number of cols)
set textwidth=99
set colorcolumn=100
autocmd FileType python setlocal textwidth=79 "PEP 8
autocmd FileType python setlocal colorcolumn=80 "PEP 8

" Break lines at words (requires line wrap)
set linebreak

" Wrap-boken line prefix
set showbreak=+++

" Sets how many lines of history Vim remembers
set history=500

" Allows Vim to use system clipboard. Requires vim-gtk.
" Note that you need to select with the mouse, and then it will be copied.
set clipboard=unnamedplus

" Automatically delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split, status line, tabs, buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Splits open at the botton and right, which is non-retarded
set splitbelow splitright

" Always show the status line
set laststatus=2

" Switching to next and previous buffer
nmap <leader>n :bn<CR>
nmap <leader>p :bp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup and files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set directory for swapfiles. // leads to complete path of swapfile.
:set directory=$HOME/.vim/swapfiles//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn on Wildmenu
set wildmenu
set wildmode=longest,list,full

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Search incrementally as typing
set incsearch

" Highlight search results
"set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Tab = 4 spaces
set expandtab
set tabstop=4 " PEP 8

" Copy indent from current line to new line and its width
set autoindent
set shiftwidth=4

" Backspace removes all 4 spaces
set softtabstop=4

" Enable smart-tabs
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Change colorscheme
"colo elflord
set background=dark
"colorscheme solarized

" Set 256 colors
set t_Co=256

" Set color of ColorColumn
highlight ColorColumn ctermbg=Blue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell check for all syntax groups
" add: 'syntax spell toplevel' to ~/.vim/after/syntax/tex.vim. Make the file if it does not exist.

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>. Next, previous, add word, remove word, replace.
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sr zug
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Edit mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Read the following,
" :help map-which-keys

" Move between splits, save a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LaTeX. inoremap works in Insert mode and avoids recursion.
autocmd FileType tex inoremap ,ref \ref{}<Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<Esc>T{i
autocmd FileType tex inoremap ,lb \label{}<Esc>T{i
autocmd FileType tex inoremap ,li \item<Space>

" Put \begin{} \end{} around the current word.
autocmd FileType tex map <leader>b YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA















