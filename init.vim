
" =========================================
" Install Plugins
" =========================================
call plug#begin("~/.vim/plugged")
Plug 'junegunn/fzf.vim' 		                " fuzzy finder plugin
Plug 'preservim/NERDTree' 		                " file browser
Plug 'tpope/vim-surround' 		                " surrounding via ys, cs, ds
Plug 'vim-airline/vim-airline'	                " fancy statusbar 
Plug 'vim-airline/vim-airline-themes'	        " fancy statusbar themes
Plug 'yuttie/comfortable-motion.vim'	        " nice scrolling
Plug 'mhinz/vim-startify'                       " start screen
Plug 'chrisbra/vim-commentary'                  " easy comment out tool
Plug 'dense-analysis/ale'                       " async linting
" Python specific plugins 
Plug 'tell-k/vim-autopep8'                      " autopep8 python formatter
Plug 'puremourning/vimspector'                  " debugger
Plug 'davidhalter/jedi-vim'                     " python linting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense 

" some themes that fit quite ok
Plug 'EdenEast/nightfox.nvim'
Plug 'hiroakis/cyberspace.vim'
"Plug 'nicknikolov/dark-matter.vim'
"Plug 'rafalbromirski/vim-aurora'
"Plug 'eskilop/NorthernLights.vim'
"Plug 'tomasiser/vim-code-dark'
"Plug 'joshdick/onedark.vim' 		    " theme
"Plug 'dracula/vim'
"Plug 'bignimbus/pop-punk.vim'
"Plug 'haishanh/night-owl.vim'
"Plug 'audibleblink/hackthebox.vim'
"Plug 'NLKNguyen/papercolor-theme'               " most awesome theme
call plug#end()           

syntax on " highlight syntax

" =========================================
" General stuff
" =========================================
set encoding=utf-8
set rtp+=/usr/local/opt/fzf     " set runtime path for fzf
set number                      " show line numbers
set rnu                         " relative linenumbers
set mouse=a                     " enable mouse for all modes
set incsearch                   " show search results as you type
set ignorecase                  " ignore case in search
set hlsearch                    " highlight all results
set noswapfile                  " disable the swapfile
set nocompatible                " maybe needed if this file will be shared some day
set hidden                      " hide buffer when opening a file
set showtabline=0               " hide tabline
set tabstop=4                   " 4 whitespaces for tabs visual presentation
set shiftwidth=4                " shift lines by 4 spaces
set smarttab                    " set tabs for a shifttabs logic
set expandtab                   " expand tabs into spaces
set autoindent                  " indent when moving to the next line while writing code
set cursorline                  " shows line under cursor
set showmatch                   " shows matching bracket pairs
set scrolloff=20                " x  lines before/after during scroll

" =========================================
" some key remappings for NERDTree
" =========================================
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ==========================================
" scrolling  customizations
" ==========================================
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 3.0

" ==========================================
" airline customizations
" ==========================================
"let g:airline#extensions#tabline#enabled = 1

" ==========================================
" general remappings
" ==========================================
inoremap jk <ESC>

" ==========================================
" autopep8 settings/mappings 
" ==========================================
let g:autopep8_on_save = 1  " format py file every time the file is saved
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


" ==========================================
" ALE settings 
" ==========================================
let g:ale_linters = { 'python': ['flake8']} 


" ==========================================
" Look and feel
" ==========================================
set t_Co=256        " 256 colors -> This is may or may not needed for PaperColor scheme. 
set background=dark " needed for PaperColor scheme
"colorscheme PaperColor
"colorscheme onedark
"colorscheme dracula
"colorscheme night-owl
"colorscheme pop-punk
"colorscheme hackthebox
"colorscheme moonfly
"colorscheme cyberspace
colorscheme carbonfox
"colorscheme darkmatter
"colorscheme northernlights
"colorscheme codedark
"colorscheme aurora
syntax enable " enable syntax highlighting

" ==============================
" vimspector settings
" ==============================
let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>dd :call vimspector#Launch()<CR>
nmap <Leader>dx :VimspectorReset<CR>
nmap <Leader>de :VimspectorEval 
nmap <Leader>dw :VimspectorWatch
nmap <Leader>do :VimspectorShowOutput
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-python', 'CodeLLDB' ]
"
" ==========================================
" fzf settings
" ==========================================
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-a> :Buffer<CR>
"
" ==========================================
" jedi settings 
" ==========================================

let g:jedi#goto_command = "<Leader>d"
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#goto_stubs_command = "<Leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<Leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<Leader>r"

" ==========================================
" at start ...
" ==========================================
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" change leader key
let mapleader = ","
" getting yank to work on osx and linux
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
