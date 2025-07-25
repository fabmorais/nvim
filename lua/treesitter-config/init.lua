require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "lua",
        "javascript",
        "typescript",
        "python",
        "yaml",
        "vim",
        "vimdoc",
        "go",
        "css",
        "cpp",
        "html",
        "rust",
        "toml",
        "terraform",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },

    rainbow = {
        enable = false,
        extended_mode = true,
    },

    refactor = {
        highlight_definitions = {
            enable = false,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<A-*>",
                goto_previous_usage = "<A-#>",
            },
        },
    },
})
