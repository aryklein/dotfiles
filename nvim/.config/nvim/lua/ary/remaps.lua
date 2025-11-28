-- split resize
vim.keymap.set('n','<C-j>',':resize -3<CR>', { silent = true, desc = 'Decrease window height' })
vim.keymap.set('n','<C-k>',':resize +3<CR>', { silent = true, desc = 'Increase window height' })
vim.keymap.set('n','<C-l>',':vertical resize -3<CR>', { silent = true, desc = 'Decrease window width' })
vim.keymap.set('n','<C-h>',':vertical resize +3<CR>', { silent = true, desc = 'Increase window width' })

-- remove highlight on search
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { silent = true, desc = 'Clear search highlight' })

-- open a terminal inside NVim
vim.keymap.set('n', '<Leader>ht', ':sp | terminal<CR>', { desc = 'Open horizontal terminal' })

-- open a vertical terminal inside VIM
vim.keymap.set('n', '<Leader>vt', ':vsp | terminal<CR>', { desc = 'Open vertical terminal' })

-- Esc key for normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- remap to move block of text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- remap to shift blocks visually
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and reselect' })
vim.keymap.set('v', '<', '<gv', { desc = 'Outdent and reselect' })

-- remap to center C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- remap to center the search line
vim.keymap.set('n', 'n', 'nzz', { desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Previous search result and center' })



-- keep paste text in the buffer
vim.keymap.set('x', '<Leader>p', '"_dP', { desc = 'Paste without yanking' })

-- help for word substitution
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute word under cursor' })

-- Copilot Chat
vim.keymap.set("n", "<Leader>cc", ":CopilotChatToggle<CR>", { silent = true, desc = 'Toggle Copilot Chat' })
