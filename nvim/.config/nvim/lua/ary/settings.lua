-- make line numbers default
vim.opt.number = true
-- make relativenumber default to help with jumping
vim.opt.relativenumber = true

-- split settings
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true

-- Enable colors in terminal
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Set highlight on search
vim.opt.hlsearch = true

-- use space instead of tab by default
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

--
vim.opt.backup = false
vim.opt.numberwidth = 1

-- disable mouse
vim.opt.mouse = ""

-- sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- netrw configuration
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- avoid pop ups sign_icons to moves your screer
vim.opt.signcolumn = 'yes'

-- show whitespace
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:.,nbsp:␣,extends:❯,precedes:❮'

-- preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- always show status line
vim.opt.laststatus = 3

-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- jump to last position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Jump to last position when opening a file",
  group = vim.api.nvim_create_augroup("jump-to-last-position", { clear = true }),
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    local last_line = vim.fn.line("$")
    --local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    if last_pos >= 1 and last_pos <= last_line and vim.bo.filetype ~= 'gitcommit' then
      vim.cmd("normal! g`\"")
    end
  end
})

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- remove trailing whitespace on save (preserves cursor and search register)
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on save',
  group = vim.api.nvim_create_augroup('remove-trailing-whitespace', { clear = true }),
  pattern = '*',
  callback = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local search = vim.fn.getreg('/')
    vim.cmd([[%s/\s\+$//e]])
    vim.cmd([[%s/\n\+\%$//e]])
    vim.fn.setreg('/', search)
    pcall(vim.api.nvim_win_set_cursor, 0, cursor)
  end,
})

-- set cursor shape to beam when exit Neovim
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
  group = vim.api.nvim_create_augroup('CursorShape', { clear = true }),
  callback = function()
    vim.opt.guicursor = 'a:ver25'
  end,
})

-- Rounded borders
vim.opt.winborder = "rounded"

-- Inline hints
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN] = "󰀪",
      [vim.diagnostic.severity.HINT] = "󰌶",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = true,
  virtual_lines = false,
})

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'
