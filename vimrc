" Basics
set list
set number
set expandtab
set tabstop=2
set shiftwidth=2
set conceallevel=0
set ignorecase
set clipboard=unnamed
set noswapfile
set nocompatible
set termguicolors

" Ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(.git|node_modules|venv|.cache|vendor)$',
  \ 'file': '\v\.(.gitignore|.DS_Store)$',
  \ }
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip,*.pyc,*/venv/*,.cache,vendor

" Plugins
call plug#begin('~/.vim/plugged')

  " Appearance
  Plug 'Nequo/vim-allomancer'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mkitt/tabline.vim'
  Plug 'airblade/vim-gitgutter'

  " Formatting
  Plug 'Yggdroot/indentLine'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'othree/yajs.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'

  " Linting
  Plug 'w0rp/ale'

  " Completion
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'ajh17/VimCompletesMe'

  " Stack specific
  Plug 'bumaociyuan/vim-swift'
  Plug 'leafgarland/typescript-vim'
  Plug 'elmcast/elm-vim'
  Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Appearance
syntax enable
colorscheme allomancer

let g:indentLine_char = '-'

filetype off

" Linter
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
filetype plugin on

let g:ale_linters = {
      \'javascript': ['eslint'], 
      \'typescript': ['tsserver', 'tslint'],
      \'python': ['flake8']
      \}

" Linter fixers
let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'typescript': ['tslint'],
      \'python': ['isort']
      \}

autocmd BufWritePost *.js,*.jsx,*.py,*.ts,*.tsx ALEFix
" Terminal Specific
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Remappings
autocmd VimEnter *
      \ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
      \|  PlugInstall | q
      \| endif

let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
      \ 'AcceptSelection("t")': ['<cr>'],
      \ }

let g:ctrlp_use_caching = 0

" Remaps
noremap <F3> :Autoformat<CR>

" Elm
let g:elm_format_autosave = 1
