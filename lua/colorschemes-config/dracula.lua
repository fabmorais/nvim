local dracula = require("dracula")
dracula.setup({
    show_end_of_buffer = true,    -- default false
    transparent_bg = true,        -- default false
    lualine_bg_color = "#44475a", -- default nil
    italic_comment = true,        -- default false
    overrides = {},
})

vim.cmd([[colorscheme dracula]])
