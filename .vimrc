colorscheme molokai
let g:rehash256 = 1
"set background=dark

syntax enable "enable syntax highlighting
let python_highlight_all = 1 "enable all Python syntax highlighting features
"set colorcolumn=115 "highlight column
set hlsearch "turn on search highlighting
set showmatch "show the matching part of the pair for [] {} and ()
set mouse=a

" <c-h> to toggle auto-highlighting of matching words
function! ToggleAutoHighlightMatchingWord()
  if !exists('#ToggleAutoHighlightMatchingWordGroup#CursorMoved')
    exe printf('match IncSearch /\V\<%s\>/',
      \ escape(expand('<cword>'), '/\'))
    augroup ToggleAutoHighlightMatchingWordGroup
      autocmd!
      autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/',
            \ escape(expand('<cword>'), '/\'))
    augroup END
  else
    let currentTab = tabpagenr()
    let currentWindow = tabpagewinnr(currentTab)
    exe 'tabdo windo match IncSeach //'
    exe currentTab 'tabn'
    exe currentWindow . 'wincmd w'
    augroup ToggleAutoHighlightMatchingWordGroup
      autocmd!
    augroup END
  endif
endfunction
noremap <c-h> :call ToggleAutoHighlightMatchingWord()<CR>

" <c-s> to prompt for search/replace of the current word
function! SearchReplaceCurrentWord()
  let cword = expand('<cword>')
  let userInput = input(':%s/' . cword . '/')
  if len(userInput) > 0
    exe '%s/' . cword . '/' . userInput
  endif
endfunction
noremap <c-s> :call SearchReplaceCurrentWord()<CR>

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
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 tw=80 spell

set foldmethod=indent
set foldlevelstart=99

" settings for Vagrantfiles
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
  setlocal ts=2 sts=2 sw=2
augroup END

" highlight text longer than 120 characters
" http://blog.ezyang.com/2010/03/vim-textwidth/
autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
autocmd BufEnter * match OverLength /\%120v.*/

" make bash aliases available from shell commands entered with :!
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
"Plug 'valloric/youcompleteme'
"Plug 'vimwiki/vimwiki'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
call plug#end()

"deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
nmap <script> <silent> <c-n> :NERDTreeToggle<CR>

" NERD Commenter
let g:NERDCustomDelimiters = { 'javascript': { 'left': '// ' } }

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

" vimwiki
"let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': {'vim': 'vim', 'javascript': 'javascript'}}]
"let g:vimwiki_use_mouse = 1
"let g:vimwiki_folding = "syntax"

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=DarkGrey  ctermbg=234
hi IndentGuidesEven guibg=LightGrey ctermbg=236

" Get any local (non-syncrhonized) .vimrc settings
try
    source ~/.vimrc.local
catch
    " do nothing
endtry
