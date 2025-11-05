require("lualine").setup({
    options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
            statusline = { "dashboard", "alpha", "starter" },
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
            "diff",
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " 󰷥",
                    readonly = " ",
                    unnamed = " 󰡯",
                },
            },
        },
        lualine_x = {
            {
                "filetype",
                colored = true,
                icon_only = false,
            },
        },
        lualine_y = {
            {
                "progress",
                separator = " ",
                padding = { left = 1, right = 1 },
            },
        },
        lualine_z = {
            {
                "location",
                padding = { left = 1, right = 1 },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "nvim-tree", "toggleterm", "lazy" },
})
