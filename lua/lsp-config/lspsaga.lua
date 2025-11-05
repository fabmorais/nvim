require("lspsaga").setup({
    ui = {
        border = "rounded",
        code_action = "",
    },
    lightbulb = {
        enable = false,
        sign = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
    diagnostic = {
        on_insert = false,
        on_insert_follow = false,
    },
    code_action = {
        num_shortcut = true,
        show_server_name = true,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },
    rename = {
        quit = "<Esc>",
        exec = "<CR>",
        in_select = true,
    },
})
