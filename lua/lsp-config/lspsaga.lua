local saga = require("lspsaga")

saga.init_lsp_saga({
	border_style = "rounded",
	finder_icons = {
		def = "  ",
		ref = "諭 ",
		link = "  ",
	},

	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
		click_support = false,
	},
})
