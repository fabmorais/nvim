return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- use 'EdenEast/nightfox.nvim'
  use("navarasu/onedark.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("rcarriga/nvim-notify")
  use("nvim-lualine/lualine.nvim")
  use("romgrk/barbar.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", requires = "p00f/nvim-ts-rainbow" })
  use("nvim-treesitter/nvim-treesitter-refactor")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("folke/which-key.nvim")
  use("akinsho/toggleterm.nvim")

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({ current_line_blame = true })
    end,
  })

  use("levouh/tint.nvim")
  use("terrortylor/nvim-comment")
  use("norcalli/nvim-colorizer.lua")
  use("glepnir/dashboard-nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("windwp/nvim-autopairs")
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  --> lsp
  use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
  use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
  use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
  use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
  use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
  use("hrsh7th/nvim-cmp") --> Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") --> Snippets plugin
end)
