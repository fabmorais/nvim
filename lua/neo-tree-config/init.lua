require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
    },
    window = {
        width = 30,
        mappings = {
            ["<tab>"] = "toggle_node",
        },
    },
    default_component_configs = {
        diagnostics = {
            symbols = {
                error = "󰅚 ",
                warn = "󰀪 ",
                info = "󰋽 ",
                hint = "󰌶 ",
            },
        },
    },
})
