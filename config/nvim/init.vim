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
set nohls
set cursorline
set laststatus=2
set showtabline=2
set noshowmode
set updatetime=100
set undofile

" Plugins
call plug#begin('~/.vim/plugged')

  " Appearance
  Plug 'Nequo/vim-allomancer'
  Plug 'datMaffin/vim-colors-bionik'
  Plug 'wadackel/vim-dogrun'
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'ryanoasis/vim-devicons'

  "Formatting
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-fugitive'

  " Completion & linting
  Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

  " Utilities 
  Plug 'tpope/vim-eunuch'
  Plug 'ervandew/supertab'

  " Language specific
  " -- Swift
  Plug 'bumaociyuan/vim-swift'

  " -- Typescript
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'

  " -- Kotlin
  Plug 'udalov/kotlin-vim'

  " Navigation
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'francoiscabrol/ranger.vim'

call plug#end()

" Appearance
syntax enable
colorscheme dogrun
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

"colorscheme bionik
let g:indentLine_char = '-'

" Statusline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'dogrun',
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'tabline': {'left': [['buffers']], 'right': [['']]},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'currentfunction'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head',
      \   'currentfunction': 'CocCurrentFunction',
      \ },
      \ }

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = 1

" Top to bottom completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" Normal mode remaps
noremap <C-p> :Files<CR>
noremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
noremap <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
noremap <silent> gd :call CocAction('jumpDefinition', 'drop') <CR>

" Global remaps
map <C-n> :NERDTreeToggle<CR>

