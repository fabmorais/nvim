require("dashboard").setup({
	config = {
		week_header = { enable = true },
		shortcut = {
			{ desc = "󰊳  Lazy Update", group = "@property", action = "Lazy update", key = "u" },
			{
				desc = " Mason Update",
				-- group = "@variable",
				group = "Number",
				action = "MasonUpdate",
				key = "m",
			},
			{
				desc = " Files",
				-- group = "@variable",
				group = "Number",
				action = "Telescope find_files",
				key = "f",
			},
		},
		footer = { "@fab - https://github.com/fabmorais" },
	},
})
