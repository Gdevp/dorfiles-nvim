" ==========================================================================
" Configuraciones generales
" ==========================================================================
filetype plugin indent on
set fileformat=unix
" Mostrar archivos ocultos
set hidden
set clipboard=unnamed

" Usar UTF-8
set encoding=utf-8
set fileencoding=utf-8

syntax enable
" Mostrar números de línea
set number

" Resaltar la sintaxis
syntax on

" Autocompletar palabras
set autoindent
set smartindent

" Usar pestañas para sangrar
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Desactivar el modo mouse
set mouse=a

" ==========================================================================
" Gestores de plugins
" ==========================================================================

" Usar Plug como gestor de plugins
" Instalar plugins con Plug
call plug#begin("~/.config/nvim/plugged")
  Plug 'junegunn/vim-plug'
  Plug 'jiangmiao/auto-pairs'
  Plug 'honza/vim-snippets'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'arcticicestudio/nord-vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
" File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'majutsushi/tagbar'
  " Otros plugins que uses
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Recommended, not required.
  Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
   " javascript
  Plug 'jelera/vim-javascript-syntax'
  Plug 'othree/yajs.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-surround'
    " Deoplete
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
call plug#end()

" =====================================================================================================
" Deoplete config enable
let g:deoplete#enable_at_startup = 1

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Configuración para NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

"fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag


" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>



" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" Ale

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_linters_explicit = 1 
let g:ale_fix_on_save = 1

" Mapping save in CTRL + s
nnoremap <C-S> :update<cr>

" ===========================================================================================

" Habilitar autocompletado
" " Activar autocompletado con nvim-lspconfig
autocmd FileType * setlocal omnifunc=lsp#complete
autocmd FileType html,css,javascript autocmd BufEnter * silent! pcall coc#start()
autocmd FileType typescript setlocal omnifunc=typescript#complete#omni
autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#completeTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" ATIVACION DE AUTOCOMPLETADO
nnoremap <C-Space> :call lsp#auto_complete()<CR>

" Mapeo para activar/desactivar el autocompletado
nmap <silent> <leader>ac :call coc#toggle_completion()<CR>

" Habilitar autocierre de etiquetas HTML y otros pares de caracteres
let g:auto_pairs = 1

" Configuración de atajo de teclado para abrir NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Atajos de teclado para acciones comunes
nnoremap <C-s> :w<CR>  " Guardar el archivo actual
nnoremap <leader>o :NERDTreeToggle<CR>  " Alternar la barra lateral de NERDTree
nnoremap <C-p> :bprev<CR>  " Cambiar al archivo anterior
nnoremap <C-m> :bnext<CR>  " Cambiar al siguiente archivo

" Habilitar nvim-compe
" Configuración básica
let g:compe = {
    \ 'enabled': v:true,
    \ 'autocomplete': v:true,
    \ }


" init.vim
"  colorscheme aura-dark " Or any Aura theme available

colorscheme nord
