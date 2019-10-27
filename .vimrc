unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Convert tabs to spaces
autocmd FileType c set tabstop=8 expandtab shiftwidth=4
autocmd FileType sh set tabstop=8 expandtab shiftwidth=4
autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Toggling paste mode
set pastetoggle=<F2>

" Disable mouse
set mouse=
set ttymouse=

" Syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy
