call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'

" for javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'scrooloose/nerdcommenter'
Plug 'unkiwii/vim-nerdtree-sync'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'tpope/vim-unimpaired'

Plug 'haya14busa/incsearch.vim'

" ToDos: need to be familar with
Plug 'mileszs/ack.vim'
Plug 'szw/vim-tags'
Plug 'easymotion/vim-easymotion'

call plug#end()


" CtrlP using vim open directory as path
let g:ctrlp_working_path_mode = 0

" using ag instead of ack
let g:ackprg = 'ag --vimgrep'

" airline
set laststatus=2
" use bufferline plugin instead of buffer shown on top
let g:airline#extensions#tabline#enabled = 1 
" let g:airline_theme='badwolf'
let g:airline_theme='molokai'
let g:airline#extensions#tabline#formatter = 'default'

"NERDTree sync settings for plugin unkiwii/vim-nerdtree-sync
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

" Begin NerdCommenter
let mapleader=","
let g:NERDSpaceDelims=1
" End NerdCommenter

" Begin Easymotion minimal settings
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.  " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" <Leader> check the mapleader settings by :echo mapleader default is \
" (backslash) and now map to , (coma key)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" End Easymotion Settings

" Incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" code folding 
set foldmethod=indent
set foldlevel=100

"disable sound, enjoying music when coding :)
set noeb vb t_vb=

set autowrite
set number
set hlsearch

set shiftwidth=4
set tabstop=4
set expandtab
set autoindent   
set smartindent  
set cursorline
set hidden

" ToDo: what doe this line mean?
execute pathogen#infect()

syntax on
set nocompatible
filetype plugin indent on

"auto open NERDTree when open vim
autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle %<CR>
"close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set backspace=indent,eol,start

"using the molokai scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

"golangs
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1 
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

"golang syntastic check
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['go'] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>
let g:go_list_type = "quickfix"


"The following [q and [b mapping is provided by unimpaired vim plugin
"find the usuage doc for unimpaired at https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
"this is for traversing the change list
"nnoremap <silent>  [q :cprevious<CR>
"nnoremap <silent>  ]q :cnext<CR>
"nnoremap <silent>  [Q :cfirst<CR>
"nnoremap <silent>  ]Q :clast<CR>

"this is for traversing between buffers
"nnoremap <silent> [b :bprevious<CR>
"nnoremap <silent> ]b :bnext<CR>
"nnoremap <silent> [B :bfirst<CR>
"nnoremap <silent> ]B :blast<CR>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'


"for typescript
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.'],
"  \   'go' : ['.'],
"  \   'objc' : ['->', '.'],
"  \   'cpp,objcpp' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }

if !exists("g:ycm_semantic_triggers")
       let g:ycm_semantic_triggers = {}
   endif
   let g:ycm_semantic_triggers['typescript'] = ['.']
   set completeopt-=preview


