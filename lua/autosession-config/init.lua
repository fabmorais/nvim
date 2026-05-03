require("auto-session").setup({
    log_level = "error",
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    bypass_save_filetypes = { "oil" },
    session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = false,
        picker_opts = { border = true },
        previewer = false,
    },
})

vim.keymap.set("n", "<C-s>", function()
    require("auto-session").search()
end, {
    noremap = true,
})
