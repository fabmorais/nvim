local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	{ "kyazdani42/nvim-tree.lua" },
	{ "rcarriga/nvim-notify" },
	{ "nvim-lualine/lualine.nvim" },
	{ "romgrk/barbar.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = "p00f/nvim-ts-rainbow" },
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "folke/which-key.nvim" },
	{ "akinsho/toggleterm.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	},
	{ "levouh/tint.nvim" },
	{ "terrortylor/nvim-comment" },
	{ "norcalli/nvim-colorizer.lua" },
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard-config")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	--> Colorschemes
	{ "mofiqul/dracula.nvim", event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
	{ "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
	{ "folke/tokyonight.nvim", event = "VeryLazy" },

	--> Debugging
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "nvim-neotest/nvim-nio" },

	--> AI
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	--> Lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" }, --> Collection of configurations for built-in LSP client
	{ "jose-elias-alvarez/null-ls.nvim" }, --> inject lsp diagnistocs, formattings, code actions, and more ...
	{ "onsails/lspkind-nvim" }, --> vscode-like pictograms for neovim lsp completion items

	--> Completions
	{ "hrsh7th/nvim-cmp" }, --> Autocompletion plugin
	{ "hrsh7th/cmp-nvim-lsp" }, --> LSP source for nvim-cmp
	{ "L3MON4D3/LuaSnip" }, --> Snippets plugin
	{ "rafamadriz/friendly-snippets" },
	{ "saadparwaiz1/cmp_luasnip" }, --> Snippets source for nvim-cmp
	{ "simrat39/rust-tools.nvim" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	--> Auto Session
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup()
		end,
	},
}

require("lazy").setup(plugins, {})
