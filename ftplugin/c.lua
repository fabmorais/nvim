-- C indentation: real TAB characters (Linux kernel style), but displayed at 4
-- columns instead of 8 for comfort. The file still uses tabs (1 tab per level,
-- kernel-correct) — only the on-screen width is a personal editor choice.
-- Overrides the global 4-space setting for C buffers only.
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
