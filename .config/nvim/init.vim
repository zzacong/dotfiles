" ~/.config/nvim/init.vim

" " --- Vim-Plug --- " "
call plug#begin(stdpath('data') . '/plugged')

" " Plugins " "
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'junegunn/goyo.vim'

" " Themes " "
" Plug 'flazz/vim-colorschemes'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

let uname = system('uname -m')

 " "--- Config --- " "
 "
syntax on
" highlight ColorColumn ctermbg=0
" set expandtab
set background=dark
set colorcolumn=80
set cursorline
set encoding=utf-8
set incsearch
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set nowrap
set number relativenumber
set smartcase
set smartindent
set splitbelow splitright
set tabstop=2 softtabstop=2 shiftwidth=2
set termguicolors t_Co=256
set undodir=~/.local/share/nvim/undodir
set undofile

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" " Color Scheme Config " "
"
" let g:lightline = { 'colorscheme': 'onehalfdark' }
" let g:lightline = { 'colorscheme': 'one' }
let g:lightline = {
						\ 'colorscheme': 'wombat',
						\ 'active': {
						\   'left': [ [ 'mode', 'paste' ],
						\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
						\ },
						\ 'component_function': {
						\   'fileformat': 'LightlineFileformat',
						\	'filetype': 'LightlineFiletype',
						\	'gitbranch': 'FugitiveHead',
						\ },
						\ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" let g:palenight_terminal_italics=1
" let g:one_allow_italics = 1

colorscheme onehalfdark
" colorscheme one
" colorscheme palenight
" colorscheme dracula


" " Open NERDTree " "
"
" autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
		\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | 
		\ quit | endif


" " Plugins Configs " "
"
if executable('rg')
		let g:rg_derive_root='true'
endif


let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

let g:coc_global_extensions = [
						\ 'coc-json',
						\ 'coc-git',
						\ 'coc-snippets',
						\ 'coc-prettier',
						\ 'coc-eslint',
						\ 'coc-pairs',
						\ 'coc-css',
						\ 'coc-tsserver',
						\ 'coc-deno',
						\ ]
						" \ 'coc-phpls',
						" \ 'coc-sql',
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS='--reverse --border'

" " Key Mapping " "
"
let mapleader = " "

nnoremap <silent> ð :vsplit<CR> <Down><Right>
nnoremap <silent> Ð :split<CR>
nnoremap <silent> <S-Left> :wincmd h<CR>
nnoremap <silent> <S-Down> :wincmd j<CR>
nnoremap <silent> <S-Up> :wincmd k<CR>
nnoremap <silent> <S-Right> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-p> :wincmd p<CR>
nnoremap <silent> <C-w> :wincmd q<CR>

nnoremap <silent> == :vertical resize +5<CR>
nnoremap <silent> -- :vertical resize -5<CR>
nnoremap <silent> ++ :resize +5<CR>
nnoremap <silent> __ :resize -5<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>U :UndotreeHide<CR>

nnoremap <C-n> :NERDTreeToggle <bar> :vertical resize 30<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>gs :Gstatus <bar> :resize 15<CR>

nnoremap <C-p> :Files<CR>
nnoremap <leader>r :Goyo<CR>

" COC Config

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <C-_> :Commentary<CR>
inoremap <silent> <C-_> <C-o>:Commentary<CR>

tnoremap <Esc> <C-\><C-n>


