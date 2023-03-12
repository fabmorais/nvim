-- TODO: using defaults
require("dashboard").setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		project = {
			enable = true,
		},
		disable_move = true,
		shortcut = {
			{ desc = "Update", icon = " ", group = "@variable", action = "update", key = "u" },
			{
				icon = " ",
				desc = "Files",
				group = "@variable",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = " ",
				desc = "Apps",
				group = "@variable",
				action = "Telescope app",
				key = "a",
			},
			{
				icon = " ",
				desc = "dotfiles",
				group = "@variable",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
})
