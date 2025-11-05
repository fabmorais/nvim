require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
        highlight = { "IblIndent" },
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = { "IblScope" },
    },
    exclude = {
        buftypes = {
            "terminal",
            "nofile",
        },
        filetypes = {
            "dashboard",
            "alpha",
            "NvimTree",
            "packer",
            "lazy",
            "help",
            "markdown",
            "text",
        },
    },
})
