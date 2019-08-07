
" Basics
set encoding=utf-8
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
set hlsearch
set cursorline

" Ignores
set wildignore+=*/.git/*,*/coverage/*,*/node_modules/*,*/.Trash/*,*/.cache/*,*/public/*,*/vendor/*,package-lock.json,yarn.lock,.DS_Store

" Plugins
call plug#begin('~/.vim/plugged')

  " Appearance
  Plug 'Nequo/vim-allomancer'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'

  " Formatting
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'othree/yajs.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'Townk/vim-autoclose'
  Plug 'junegunn/rainbow_parentheses.vim'

  " Linting
  Plug 'w0rp/ale'

  " Completion
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  " Stack specific
  Plug 'bumaociyuan/vim-swift'
  Plug 'leafgarland/typescript-vim'
  Plug 'elmcast/elm-vim'
  Plug 'posva/vim-vue'

  " fzf
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1

" Completion
" let g:deoplete#enable_at_startup = 1

" Appearance
syntax enable
colorscheme allomancer

let g:indentLine_char = '-'

filetype off

" Linter
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '-m flake8'
call ale#Set('python_black_auto_pipenv', 1)
filetype plugin on

" Linters
let g:ale_linters = {
      \'javascript': ['eslint'], 
      \'typescript': ['tsserver', 'tslint', 'eslint'],
      \'python': ['flake8']
      \}

" Fixers
let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'typescript': ['tslint', 'eslint'],
      \'python': ['isort', 'black']
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

" Normal mode remaps
noremap <C-p> :Files<CR>

"Ctrl-V Elm
let g:elm_format_autosave = 1
