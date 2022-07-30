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

