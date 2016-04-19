colorscheme molokai
let g:rehash256 = 1
set background=dark

syntax enable "enable syntax highlighting
let python_highlight_all = 1 "enable all Python syntax highlighting features
set colorcolumn=115 "highlight column
set hlsearch "turn on search highlighting
set showmatch "show the matching part of the pair for [] {} and ()

" wrap text
set wrap linebreak nolist

" line numbers
set relativenumber
set number
set cursorline
set ruler

" tabs/spaces
set autoindent
set expandtab
set ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" settings for Vagrantfiles
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
  setlocal ts=2 sts=2 sw=2
augroup END

let $BASH_ENV = '~/.bash_aliases'


"" PLUGINS
"" -------
filetype plugin on
call plug#begin('~/.config/nvim/plugged')
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'rodjek/vim-puppet'
call plug#end()

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
autocmd VimEnter * NERDTreeToggle

" vim-airline
let g:airline_powerline_fonts = 1

" python-mode
"let g:pymode_python = 'python' " uncomment for Python 2.7
let g:pymode_python = 'python3' " uncomment for Python 3.4
let g:pymode_rope = 1 " autocompletion (0 = off, 1 = on)

" force black background
highlight Normal ctermbg=black
