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
vim.g.maplocalleader = "\\"

local plugins = {
    --> UI
    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("nvim-tree-config")
        end,
    },
    { "echasnovski/mini.icons", version = "*", lazy = false },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require("notify-config")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine-config")
        end,
    },
    {
        "romgrk/barbar.nvim",
        event = "BufAdd",
        config = function()
            require("barbar-config")
        end,
    },

    --> Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = "p00f/nvim-ts-rainbow",
        config = function()
            require("treesitter-config")
        end,
    },
    { "nvim-treesitter/nvim-treesitter-refactor", event = { "BufReadPost", "BufNewFile" } },

    --> Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },

    --> Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-config")
        end,
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm-config")
        end,
    },

    --> Git
    { "tpope/vim-fugitive", cmd = { "Git", "G", "Gstatus", "Gdiff", "Gblame" } },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                signcolumn = true,
            })
        end,
    },

    --> UI enhancements
    {
        "levouh/tint.nvim",
        event = "VeryLazy",
        config = function()
            require("tint-config")
        end,
    },
    {
        "terrortylor/nvim-comment",
        config = function()
            require("comment-config")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("colorizer-config")
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard-config")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = function()
            require("blankline-config")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("autopairs-config")
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("diffview-config")
        end,
    },
    { "mbbill/undotree", cmd = "UndotreeToggle" },

    --> Movement / Text Manipulation
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        config = function()
            require("illuminate").configure({
                providers = {
                    "lsp",
                    "treesitter",
                    "regex",
                },
                delay = 100,
                filetypes_denylist = {
                    "dashboard",
                    "alpha",
                    "NvimTree",
                    "lazy",
                    "help",
                    "terminal",
                },
                under_cursor = true,
                min_count_to_highlight = 2,
            })
        end,
    },

    --> Colorschemes
    { "mofiqul/dracula.nvim", lazy = false, priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    { "folke/tokyonight.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },
    { "AlexvZyl/nordic.nvim", lazy = true },
    { "maxmx03/fluoromachine.nvim", name = "synthwave", lazy = true },
    { "rose-pine/neovim", name = "rose-pine", lazy = true },
    { "kdheepak/monochrome.nvim", lazy = true },
    { "hardhackerlabs/theme-vim", name = "hardhacker", lazy = true },
    { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = true },

    --> Debugging
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = { "<F5>", "<F10>", "<F11>", "<F12>" },
        config = function()
            require("debugger-config")
            require("debugger-config.rust")
            require("debugger-config.python")
        end,
    },
    { "rcarriga/nvim-dap-ui", lazy = true, dependencies = "nvim-dap" },
    { "theHamsta/nvim-dap-virtual-text", lazy = true, dependencies = "nvim-dap" },
    { "nvim-neotest/nvim-nio", lazy = true },

    --> AI
    { "github/copilot.vim", event = "InsertEnter" },

    --> LSP
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", cmd = "Mason", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lsp-config.lsp")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lsp-config.null-ls")
        end,
    },
    { "onsails/lspkind-nvim", lazy = true },

    --> Completions
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("lsp-config.nvim-cmp")
        end,
    },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        event = "InsertEnter",
    },
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    { "simrat39/rust-tools.nvim", ft = "rust" },
    {
        "gelguy/wilder.nvim",
        event = "CmdlineEnter",
        build = ":UpdateRemotePlugins",
        config = function()
            require("wilder-config")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        dependencies = { "nvim-tree/nvim-web-devicons", "neovim/nvim-lspconfig" },
        config = function()
            require("lsp-config.lspsaga")
        end,
    },

    --> Auto Session
    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            require("auto-session").setup()
        end,
    },
}

require("lazy").setup(plugins, {})
