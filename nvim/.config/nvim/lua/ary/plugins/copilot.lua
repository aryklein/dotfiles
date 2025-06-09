-- -- Copilot plugin
-- return {
--     'github/copilot.vim',
--     config = function()
--         vim.g.copilot_no_tab_map = true
--         vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--
--         -- Uncomment the following line to disable copilot by default
--         -- vim.g.copilot_enabled = 0
--
--         -- By default copilot is disabled for some filetypes (IDK why), so the following
--         -- code wiil enable copilot for those filetypes
--         vim.g.copilot_filetypes = {
--             ["yaml.ansible"] = 1,
--             ["yaml"] = 1,
--         }
--     end
-- }
--
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require('ary.copilot')
  end,
}
