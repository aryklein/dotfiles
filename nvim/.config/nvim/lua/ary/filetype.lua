-- Helper function to set indentation
local function set_indent(size, use_tabs)
  vim.opt_local.shiftwidth = size
  vim.opt_local.tabstop = size
  vim.opt_local.softtabstop = size
  vim.opt_local.expandtab = not use_tabs
end

local indent_rules = {
  yaml = { size = 2 },
  ['yaml.ansible'] = { size = 2 },
  lua = { size = 2 },
  json = { size = 2 },
  jsonc = { size = 2 },
  terraform = { size = 2 },
  hcl = { size = 2 },
  go = { size = 4, use_tabs = true },
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    local rule = indent_rules[vim.bo.filetype]
    if rule then
      set_indent(rule.size, rule.use_tabs)
    end
  end,
})

local filetype_settings = {
  yaml = function()
    vim.opt_local.colorcolumn = '160'
  end,
  markdown = function()
    vim.opt_local.colorcolumn = '80'
    vim.opt_local.formatoptions:append('w')
    vim.opt_local.textwidth = 80
  end,
  python = function()
    vim.opt_local.colorcolumn = '79'
  end,
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    local apply = filetype_settings[vim.bo.filetype]
    if apply then
      apply()
    end
  end,
})

-- Ansible files should be set to yaml.ansible
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.yaml', '*.yml' },
  callback = function()
    -- Search for ansible-specific keywords
    if vim.fn.search([[hosts:\|tasks:\|loop:\|set_fact:]], 'nw') ~= 0 then
      vim.bo.filetype = 'yaml.ansible'
      vim.opt_local.colorcolumn = '120'
    end
  end,
})

local filetype_patterns = {
  hcl = { '*.hcl', '.terraformrc', 'terraform.rc' },
  terraform = { '*.tf', '*.tfvars' },
  json = { '*.tfstate', '*.tfstate.backup' },
}

for filetype, patterns in pairs(filetype_patterns) do
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = patterns,
    callback = function()
      vim.bo.filetype = filetype
    end,
  })
end
