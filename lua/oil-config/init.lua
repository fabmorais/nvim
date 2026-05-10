require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name)
            return name == ".git"
        end,
    },
    win_options = {
        wrap = false,
        signcolumn = "yes:2",
        cursorline = true,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = {
            desc = "Toggle preview (narrow oil)",
            callback = function()
                require("oil.actions").preview.callback()
                if #vim.api.nvim_tabpage_list_wins(0) > 1 then
                    vim.api.nvim_win_set_width(vim.api.nvim_get_current_win(), 28)
                end
            end,
        },
        ["<Tab>"] = {
            desc = "Enter directory or preview file",
            callback = function()
                local entry = require("oil").get_cursor_entry()
                if entry and entry.type == "directory" then
                    require("oil.actions").select.callback()
                else
                    require("oil.actions").preview.callback()
                    if #vim.api.nvim_tabpage_list_wins(0) > 1 then
                        vim.api.nvim_win_set_width(vim.api.nvim_get_current_win(), 28)
                    end
                end
            end,
        },
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" } },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
})
