require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	session_lens = {
		buftypes_to_ignore = {},
		load_on_setup = true,
		theme_conf = { border = true },
		previewer = false,
	},
	pre_save_cmds = { "NvimTreeClose" },
	save_extra_cmds = {
		"NvimTreeOpen",
	},
	post_restore_cmds = {
		"NvimTreeClose",
	},
})

vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
	noremap = true,
})
