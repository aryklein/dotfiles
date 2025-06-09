local ensure_installed = {
  'bash',
  'yaml',
  'html',
  'python',
  'json',
  'lua',
  'dockerfile',
  'go',
  'hcl',
  'comment',
  'sql',
  'toml',
  'c',
  'terraform',
  'gitcommit',
  'gitignore',
  'markdown',
  'make',
  'diff'
}

local filetype = {
  "bash",
  "yaml",
  "html",
  "python",
  "json",
  "lua",
  "dockerfile",
  "go",
  "hcl",
  "comment",
  "sql",
  "toml",
  "c",
  "terraform",
  "gitcommit",
  "gitignore",
  "markdown",
  "make",
  "diff",
}

require'nvim-treesitter'.setup()
require'nvim-treesitter'.install(ensure_installed)
vim.api.nvim_create_autocmd("FileType", {
  pattern = filetype,
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if not ok then
      print("Treesitter not enabling")
      return
    end
  end
})
