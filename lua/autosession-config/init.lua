require("auto-session").setup({
    log_level = "error",
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        picker_opts = { border = true },
        previewer = false,
    },
    pre_save_cmds = { "NvimTreeClose" },
    save_extra_cmds = { "NvimTreeOpen" },
    post_restore_cmds = { "NvimTreeClose" },
})

vim.keymap.set("n", "<C-s>", function()
    require("auto-session").search()
end, {
    noremap = true,
})
