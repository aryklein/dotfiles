" A customized init.vim for neovim (https://neovim.io/) 

" enable syntax
syntax on

"" basic setup
set nobackup
set smartindent
set number relativenumber
" make the new split window appear below/right the current window
set splitbelow splitright
" toggling paste mode. This prevents Vim from auto-indenting the pasted code
set pastetoggle=<F2>
" disable cursor style change (only for Neovim)
set guicursor=""

" convert tabs to spaces
autocmd FileType c set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sh set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" make adjusing split sizes a bit more friendly:
" resize current split by +/- 3 
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>

" open a terminal inside VIM
noremap <Leader>tt :sp \| :terminal<CR>
" open a vertical terminal inside VIM
noremap <Leader>vt :vsp \| :terminal<CR>
" shortcuts for line numbering
noremap <Leader>n :set number relativenumber<CR>
noremap <Leader>nn :set nonumber norelativenumber<CR>
" shortcut for vertical Explore
noremap <Leader>e :Vexplore<CR>
" Esc key for normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" removes pipes | that act as separators on splits
" (commented out - this option mess up gruvbox)
"set fillchars=vert:\ 

" change line number color
" (commented out - this option mess up gruvbox)
"highlight LineNr ctermfg=grey

" go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
autocmd BufReadPost *    
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" plugins - vim-plug
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" gruvbox theme setup
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
colorscheme gruvbox

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3

