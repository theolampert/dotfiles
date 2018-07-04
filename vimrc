" Basics
set list
set number
set expandtab
set tabstop=2
set shiftwidth=2
set conceallevel=0
set ignorecase
set clipboard=unnamed

" Allow directory specific config
set exrc

" Ignores
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|venv|.cache|vendor)$'
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip,*.pyc,*/venv/*,.cache,vendor

call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'jacoborus/tender.vim'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'mkitt/tabline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'

call plug#end()

" Appearance
syntax enable
colorscheme tender

let g:indentLine_char = '-'

set nocompatible
filetype off

" Linter
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint']}

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

" Remaps
noremap <F3> :Autoformat<CR>
