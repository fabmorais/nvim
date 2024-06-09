require("dashboard").setup({
	config = {
		week_header = { enable = true },
		shortcut = {
			{
				desc = " Update",
				-- group = "@variable",
				group = "Number",
				action = "MasonUpdate",
				key = "u",
			},
			{
				desc = " Files",
				-- group = "@variable",
				group = "Number",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Packer",
				-- group = "@variable",
				group = "Number",
				action = "PackerSync",
				key = "p",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
		footer = { "@fab - https://github.com/fabmorais" },
	},
})
