-- Helper function to set indentation
local function set_indent(size, use_tabs)
  return function()
    vim.opt_local.shiftwidth = size
    vim.opt_local.tabstop = size
    vim.opt_local.softtabstop = size
    vim.opt_local.expandtab = not use_tabs
  end
end

-- 2-space indentation for common filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "lua", "json", "jsonc", "terraform", "hcl" },
  callback = set_indent(2),
})

-- Go settings: use tabs (gofmt standard)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = set_indent(4, true),
})

-- YAML colorcolumn
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.colorcolumn = "160"
  end,
})

-- Ansible files should be set to yaml.ansible
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.yaml", "*.yml" },
  callback = function()
    -- Search for ansible-specific keywords
    if vim.fn.search([[hosts:\|tasks:\|loop:\|set_fact:]], "nw") ~= 0 then
      vim.bo.filetype = "yaml.ansible"
      vim.opt_local.colorcolumn = "120"
    end
  end,
})

-- Add colorcolumn to Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.colorcolumn = "80"
    vim.opt_local.formatoptions:append("w")
    vim.opt_local.textwidth = 80
  end,
})

-- Add colorcolumn to Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "79"
  end,
})

-- Terraform and Hashicorp files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hcl",
  callback = function()
    vim.bo.filetype = "hcl"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".terraformrc", "terraform.rc" },
  callback = function()
    vim.bo.filetype = "hcl"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tfstate", "*.tfstate.backup" },
  callback = function()
    vim.bo.filetype = "json"
  end,
})
