-- remap leader key
vim.g.mapleader = ' '
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

-- remap to center C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- remap to center the search line
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- keep paste text in the buffer
vim.keymap.set('x', '<Leader>p', '"_dP')

-- -- Telescope remap using lua function
-- Telescope find files
vim.keymap.set('n','<Leader>ff', function()
    require('telescope.builtin').find_files()
end)

-- Telescope live grep
vim.keymap.set('n','<Leader>lg', function()
    require('telescope.builtin').live_grep()
end)

-- Telescope buffers
vim.keymap.set('n','<Leader>fb', function()
    require('telescope.builtin').buffers()
end)

-- help for world sustitution
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
