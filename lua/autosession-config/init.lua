local function close_nvim_tree()
    if package.loaded["nvim-tree"] then
        vim.cmd("NvimTreeClose")
    end
end

local function open_nvim_tree()
    if package.loaded["nvim-tree"] then
        vim.cmd("NvimTreeOpen")
    end
end

require("auto-session").setup({
    log_level = "error",
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = false,
        picker_opts = { border = true },
        previewer = false,
    },
    pre_save_cmds = { close_nvim_tree },
    save_extra_cmds = { open_nvim_tree },
    post_restore_cmds = { close_nvim_tree },
})

vim.keymap.set("n", "<C-s>", function()
    require("auto-session").search()
end, {
    noremap = true,
})
