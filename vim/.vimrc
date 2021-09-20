" The new default vimrc file has been included since vim 8, with some very sensible defaults.
" However it is not enabled by default if you have a .vimrc file already.
" If you create your own .vimrc, it is recommended to add these 2 line somewhere near the top.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" enable syntax
syntax on
"" basic setup
set nobackup
set smartindent
" add relative line numbers
set number relativenumber
" make the new split window appear below/right the current window
set splitbelow splitright
" toggling paste mode. This prevents Vim from auto-indenting the pasted code
set pastetoggle=<F2>
" Disable mouse
set mouse=
set ttymouse=

" convert tabs to spaces
autocmd FileType c set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sh set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Make adjusing split sizes a bit more friendly:
" resize current buffer by +/- 3 
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>

" open a terminal inside VIM
noremap <Leader>tt :terminal<CR>
" open a vertical terminal inside VIM
noremap <Leader>vt :vertical terminal<CR>

" Removes pipes | that act as separators on splits
set fillchars=vert:\ 

" set shortcuts for line numbering
noremap <Leader>n :set number relativenumber<CR>
noremap <Leader>nn :set nonumber norelativenumber<CR>

" Change line number color
highlight LineNr ctermfg=grey
