-- gets or sets global variables. vim.g acts like the let g:
local g = vim.g
-- set global, window and buffer settings - vim.opt acts like the :set
local set = vim.opt
-- to call vimscript commands (or expressions) that don't have a lua equivalent
local cmd = vim.cmd

local api = vim.api
local fn = vim.fn

-- add line number
set.number = true
-- add relative number
set.relativenumber = true
set.splitbelow = true
set.splitright = true
set.cursorline = true
-- Enable colors in terminal
set.termguicolors = true
 -- Set highlight on search
set.hlsearch = true
 -- use space instead of tab by default
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.backup = false
set.background = dark
set.numberwidth = 1
-- disable mouse
set.mouse = nil

-- Remember last cursor position 
cmd [[
    syntax enable
    autocmd BufNewFile,BufRead Jenkinsfile setf groovy

    autocmd BufReadPost * 
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
]]

-- netrw configuration
g['netrw_banner'] = 0
g['netrw_liststyle'] = 3
