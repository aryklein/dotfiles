-- YAML settings: use indentation of 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.colorcolumn = "160"
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
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
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.expandtab = true
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
-- (First clear old filetypedetect for *.tf if needed)
vim.api.nvim_clear_autocmds({
  event = { "BufRead", "BufNewFile" },
  pattern = "*.tf",
})

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

-- Terraform/HCL settings: use indentation of 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terraform", "hcl" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- LUA settings: use indentation of 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- JSON settings: use indentation of 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Go settings: use tabs (gofmt standard)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false
  end,
})
