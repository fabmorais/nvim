require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = { ".git" },
        },
        follow_current_file = { enabled = true },
    },
    window = {
        width = 30,
        mappings = {
            ["<space>"] = "noop",
            ["<tab>"] = function(state)
                local node = state.tree:get_node()
                if node.type == "directory" then
                    require("neo-tree.sources.filesystem.commands").toggle_node(state)
                else
                    require("neo-tree.sources.common.commands").toggle_preview(state)
                end
            end,
            ["/"] = "noop",
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
