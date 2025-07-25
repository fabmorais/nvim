require("onedark").setup({
    style = "darker",
    transparent = true,
    code_style = {
        comments = "italic",
    },

    highlights = {
        TSVariable = { fg = "$red" },
    },
})

require("onedark").load()
