colorscheme molokai
let g:rehash256 = 1
set background=dark

syntax enable "enable syntax highlighting
let python_highlight_all = 1 "enable all Python syntax highlighting features
set colorcolumn=115 "highlight column
set hlsearch "turn on search highlighting
set showmatch "show the matching part of the pair for [] {} and ()
set mouse=a

autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

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
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype puppet setlocal ts=2 sts=2 sw=2

set foldmethod=indent
set foldlevelstart=99

" settings for Vagrantfiles
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
  setlocal ts=2 sts=2 sw=2
augroup END

let $BASH_ENV = '~/.bash_aliases'

let g:python_host_prog = '/Users/twilliams/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/twilliams/.pyenv/versions/neovim3/bin/python'

"" PLUGINS
"" -------
filetype plugin on
call plug#begin('~/.config/nvim/plugged')
"Plug 'klen/python-mode', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
"Plug 'pangloss/vim-javascript'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
"Plug 'rodjek/vim-puppet'
Plug 'milkypostman/vim-togglelist'
Plug 'solarnz/thrift.vim'
Plug 'leafgarland/typescript-vim'
"Plug 'quramy/tsuquyomi' " typescript completion
"Plug 'shougo/vimproc.vim' " dependency for tsuguyomi
Plug 'jason0x43/vim-js-indent'
Plug 'tfnico/vim-gradle'
"Plug 'mxw/vim-jsx'
Plug 'saltstack/salt-vim'
Plug 'elmcast/elm-vim'
call plug#end()

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
nmap <script> <silent> <c-n> :NERDTreeToggle<CR>

" vim-togglelist
let g:toggle_list_no_mappings = 1
let g:toggle_list_copen_command="lopen"
nmap <script> <silent> <c-l> :call ToggleLocationList()<CR>
nmap <script> <silent> <c-q> :call ToggleQuickfixList()<CR>

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']

let g:ale_python_flake8_executable = '/Users/twilliams/.pyenv/shims/flake8'
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \}
"let g:ale_javascript_eslint_options = '-c .eslintrc.json'

" vim-jsx
let g:jsx_ext_required = 0 " allow JSX in normal JS files

" force black background
highlight Normal ctermbg=black

" Get any local (non-syncrhonized) .vimrc settings
try
    source ~/.vimrc.local
catch
    " do nothing
endtry
