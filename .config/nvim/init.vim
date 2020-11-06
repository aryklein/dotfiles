" A customized init.vim for neovim (https://neovim.io/) 

" Syntax
syntax on

" Convert tabs to spaces
autocmd FileType c set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sh set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Toggling paste mode. This prevents Vim from auto-indenting the pasted code
set pastetoggle=<F2>

" Make the new split window appear below/right the current window
set splitbelow splitright

" Make adjusing split sizes a bit more friendly:
" resize current buffer by +/- 3 
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>

" open a terminal inside VIM
noremap <Leader>tt :sp \| :terminal<CR>
" open a vertical terminal inside VIM
noremap <Leader>vt :vsp \| :terminal<CR>

noremap <Leader>e :Vexplore<CR>

tnoremap <Esc> <C-\><C-n>

" Removes pipes | that act as separators on splits
set fillchars=vert:\ 

" add relative line numbers
set number relativenumber

" set shortcuts for line numbering
noremap <Leader>n :set number relativenumber<CR>
noremap <Leader>nn :set nonumber norelativenumber<CR>

" Change line number color
highlight LineNr ctermfg=grey

" disable cursor style change
set guicursor=""

" go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
autocmd BufReadPost *    
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" plugins
call plug#begin()
Plug 'gruvbox-community/gruvbox'
"Plug 'vim-airline/vim-airline'    
"Plug 'vim-airline/vim-airline-themes'
"Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" use gruvbox theme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
colorscheme gruvbox

" netrw remove banner
let g:netrw_banner = 0
let g:netrw_liststyle = 3
