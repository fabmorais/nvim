local vault_path = vim.fn.expand(os.getenv("OBSIDIAN_VAULT"))

require("obsidian").setup({
    legacy_commands = false,

    workspaces = {
        {
            name = "main",
            path = vault_path,
        },
    },

    new_notes_location = "current_dir",

    daily_notes = {
        folder = "daily notes",
        date_format = "%Y/%m/%d-%m-%Y",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily" },
        template = "New notes.md",
    },

    templates = {
        folder = "_templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    picker = {
        name = "telescope.nvim",
    },

    link = {
        style = "wiki",
        format = "shortest",
    },

    note_id_func = function(title)
        if title ~= nil and title ~= "" then
            return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-_]", ""):lower()
        end
        return tostring(os.time())
    end,

    ui = { enable = false },

    attachments = {
        folder = "assets",
    },
})
