---@type fluoromachine
require("fluoromachine").setup({
    glow = true,
    theme = "retrowave",
    transparent = true,
    plugins = {
        neotree = false,
    },
})

vim.cmd.colorscheme("fluoromachine")
