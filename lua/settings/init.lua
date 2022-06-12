local set = vim.opt

set.mouse = 'a'
set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

set.relativenumber = true
set.cursorline = true

set.hidden = true

set.list = true
set.listchars:append("space:⋅")
-- set.listchars:append("eol:↴")

vim.notify = require("notify")
