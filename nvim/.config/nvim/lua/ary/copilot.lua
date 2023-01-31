vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- disable by default copilot
-- vim.g.copilot_enabled = 0

-- enable copilot for specific filetypes
-- Ansible yaml files
vim.g.copilot_filetypes = {
    ["yaml.ansible"] = 1,
    ["yaml"] = 1,
}
