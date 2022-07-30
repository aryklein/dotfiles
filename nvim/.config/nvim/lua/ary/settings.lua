-- gets or sets global variables. vim.g acts like the let g:
local g = vim.g
-- set global, window and buffer settings - vim.opt acts like the :set
local set = vim.opt
-- to call vimscript commands (or expressions) that don't have a lua equivalent
local cmd = vim.cmd

local api = vim.api
local fn = vim.fn

-- add line number
set.number = true
-- add relative number
set.relativenumber = true
set.splitbelow = true
set.splitright = true
set.cursorline = true
-- Enable colors in terminal
set.termguicolors = true
 -- Set highlight on search
set.hlsearch = true
 -- use space instead of tab by default
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.backup = false
set.background = dark
set.numberwidth = 1

-- Remember last cursor position 
cmd [[
    syntax enable
    autocmd BufNewFile,BufRead Jenkinsfile setf groovy

    autocmd BufReadPost * 
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
]]

-- Remember last position in file
-- cmd[[autocmd BufReadPost * lua goto_last_pos()]]
-- function goto_last_pos()
--   local last_pos = fn.line("'\"")
--   if last_pos > 0 and last_pos <= fn.line("$") then
--     api.nvim_win_set_cursor(0, {last_pos, 0})
--   end
-- end
--
--

-- netrw configuration
g['netrw_banner'] = 0
g['netrw_liststyle'] = 3

------------- remaps 
-- 
-- split resize
vim.keymap.set('n','<C-j>',':resize -3<CR>', { silent = true })
vim.keymap.set('n','<C-k>',':resize +3<CR>', { silent = true })
vim.keymap.set('n','<C-l>',':vertical resize -3<CR>', { silent = true })
vim.keymap.set('n','<C-h>',':vertical resize +3<CR>', { silent = true })

-- open a terminal inside NVim
vim.keymap.set('n', '<Leader>ht', ':sp \\| :terminal<CR>')

-- open a vertical terminal inside VIM
vim.keymap.set('n', '<Leader>vt', ':vsp \\| :terminal<CR>')

-- shortcut for vertical Explore
vim.keymap.set('n', '<F9>', ':NvimTreeToggle<CR>')

-- Esc key for normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- toggle line numbering
--nnoremap <silent><F6> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

-- toggle vim-gitgutter
vim.keymap.set('n', '<F7>', ':GitGutterToggle<CR>', { silent = true })

-- remap to move block of text
vim.keymap.set('v', 'J', "'>+1<CR>gv=gv")
vim.keymap.set('v', 'K', "'<-2<CR>gv=gv")

-- remap to shift blocks visually
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Telescope remap
vim.keymap.set('n','<Leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n','<Leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n','<Leader>fb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n','<Leader>fh', '<cmd>Telescope help_tags<CR>')
