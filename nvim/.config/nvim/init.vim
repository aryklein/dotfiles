" A customized init.vim for neovim (https://neovim.io/) 

" enable syntax
syntax on
" no backup
set nobackup
set smartindent
set number relativenumber
" make the new split window appear below/right the current window
set splitbelow splitright
" toggling paste mode. This prevents Vim from auto-indenting the pasted code
set pastetoggle=<F5>
" disable cursor style change (only for Neovim)
set guicursor=""
" highlight the cursor line
set cursorline
" convert tabs to spaces
autocmd FileType c set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sh set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy
" make adjusing split sizes a bit more friendly - resize current split by +/- 3 
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>
" open a terminal inside VIM
noremap <Leader>ht :sp \| :terminal<CR>
" open a vertical terminal inside VIM
noremap <Leader>vt :vsp \| :terminal<CR>
" shortcut for vertical Explore
noremap <Leader>e :NERDTreeToggle<CR>
" Esc key for normal mode in terminal
tnoremap <Esc> <C-\><C-n>
" toggle line numbering
nnoremap <silent><F6> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" toggle vim-gitgutter
nnoremap <silent><F7> :GitGutterToggle<CR>
" toggle indentline plugin
nnoremap <silent><F8> :IndentLinesToggle<CR>

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

"" plugins - vim-plug
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdcommenter'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

"" airline config
let g:airline#extensions#hunks#enabled = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

"" indentline plugin config
let g:indentLine_char = '▏'
"let g:indentLine_setConceal = 0

"" NERDCommenter config
let g:NERDDefaultAlign = 'left'

"" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3

"" gruvbox theme config
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

"" Theme
" Contrast should be set before colorscheme gruvbox
"(https://github.com/gruvbox-community/gruvbox/wiki/Troubleshooting#2-cannot-set-contrast)
colorscheme gruvbox

" enable 24-bit color
set termguicolors

"" telescope things
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" remap to move block of text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
