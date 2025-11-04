local set = vim.opt

-- Session options for better filetype/highlighting after restore
set.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

set.mouse = "a"
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.inccommand = "split" -- in test

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true

set.relativenumber = true
set.number = true
set.cursorline = true

set.hidden = true

set.list = true
-- set.listchars:append("space:⋅")
-- set.listchars:append("eol:↴")
-- set.clipboard = "unnamedplus"
