-- neovim-ayu has no transparency option: clear the background groups instead.
require("ayu").setup({
    mirage = false, -- true for the softer "mirage" variant
    overrides = {
        Normal = { bg = "None" },
        NormalNC = { bg = "None" },
        SignColumn = { bg = "None" },
        EndOfBuffer = { bg = "None" },
    },
})

vim.cmd("colorscheme ayu-dark")
