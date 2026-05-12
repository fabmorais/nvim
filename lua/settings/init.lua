local set = vim.opt

-- Session options for better filetype/highlighting after restore
set.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

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

set.timeoutlen = 100

set.relativenumber = true
set.number = true
set.cursorline = true
set.signcolumn = "yes"
set.laststatus = 3

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "html", "sh", "bash", "zsh" },
    callback = function()
        vim.treesitter.stop()
    end,
})

vim.filetype.add({
    pattern = {
        [".*/templates/.*%.ya?ml"] = "helm",
        [".*/templates/.*%.tpl"] = "helm",
        [".*%.yaml%.gotmpl"] = "helm",
        [".*%.tpl"] = "helm",
        ["Caddyfile"] = "caddyfile",
        ["Caddyfile%..*"] = "caddyfile",
    },
})

-- Re-run filetype detection on session-restored buffers (auto-session
-- restores with noautocmd, so BufRead never fires for them)
local function detect_ft(buf)
    if vim.bo[buf].filetype ~= "" then
        return
    end
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" then
        return
    end
    local ft = vim.filetype.match({ buf = buf, filename = name })
    if ft then
        vim.bo[buf].filetype = ft
    end
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        detect_ft(args.buf)
    end,
})

-- BufEnter doesn't fire for the buffer already active after session restore.
-- Sweep all loaded buffers once everything finished initializing.
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(buf) then
                    detect_ft(buf)
                end
            end
        end)
    end,
})

-- gx: prepend https:// to bare domains so xdg-open accepts them
local original_ui_open = vim.ui.open
vim.ui.open = function(path, opt)
    if
        type(path) == "string"
        and not path:match("^%w[%w+.-]*://") -- no scheme
        and not path:match("^[/.~]") -- not a filesystem path
        and not path:match("^mailto:")
        and path:match("^[%w%-]+%.[%w%-.]+") -- looks like a domain
    then
        path = "https://" .. path
    end
    return original_ui_open(path, opt)
end

set.list = true
-- set.listchars:append("space:⋅")
-- set.listchars:append("eol:↴")
-- set.clipboard = "unnamedplus"
