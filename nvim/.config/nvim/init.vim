"" --- General 
"
syntax on
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nobackup
set smartindent
set number
set relativenumber
set splitbelow
set splitright
set cursorline
set pastetoggle=<F5>
set background=dark
set termguicolors
set numberwidth=1

" go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
autocmd BufReadPost *    
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" --- syntax highlighting for groovy (Jenkinsfile)
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

"" --- plugins
"
" import plugins with vim-plug
runtime ./plug.vim

"" --- plugins configuration
"
" --- Telescope
lua require('config.telescope')

" --- Treesitter
lua require('config.treesitter')

" --- LSP
lua require('config.lspconfig')

" --- airline config
let g:airline#extensions#hunks#enabled = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'

" --- NERDCommenter config
let g:NERDDefaultAlign = 'left'

" --- netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3

"" --- color scheme
"
" --- Dracula theme
colorscheme dracula

"" --- remaps
"
" make adjusing split sizes a bit more friendly
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize -3<CR>
nnoremap <silent> <C-h> :vertical resize +3<CR>
" open a terminal inside NVim
nnoremap <Leader>ht :sp \| :terminal<CR>
" open a vertical terminal inside VIM
nnoremap <Leader>vt :vsp \| :terminal<CR>
" shortcut for vertical Explore
nnoremap <F9> :NERDTreeToggle<CR>
" Esc key for normal mode in terminal
tnoremap <Esc> <C-\><C-n>
" toggle line numbering
nnoremap <silent><F6> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" toggle vim-gitgutter
nnoremap <silent><F7> :GitGutterToggle<CR>
" remap to move block of text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" remap to shift blocks visually
vnoremap > >gv
vnoremap < <gv
" Telescope remap
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

