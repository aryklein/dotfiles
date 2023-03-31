-- add line number
vim.opt.number = true
-- add relative number
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
-- Enable colors in terminal
vim.opt.termguicolors = true
 -- Set highlight on search
vim.opt.hlsearch = true
 -- use space instead of tab by default
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.backup = false
vim.opt.background = 'dark'
vim.opt.numberwidth = 1
-- disable mouse
vim.opt.mouse = nil

-- enable syntax
-- jump to last position when opening a file
-- remove trailing whitespace on save
vim.cmd [[
    syntax enable
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
    autocmd BufWritePre * :%s/\s\+$//e
]]

-- set cursor shape to beam when exit Neovim
vim.cmd [[
    augroup CursorShape
        autocmd!
        autocmd VimLeave,VimSuspend * set guicursor=a:ver25
    augroup END
]]

-- netrw configuration
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3

-- avoid pop ups sign_icons to moves your screer
vim.opt.signcolumn = 'yes'

-- set leader key
vim.g.mapleader = ' '

-- show whitespace
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:.,nbsp:␣,extends:❯,precedes:❮'
