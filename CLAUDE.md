# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build/Lint/Test Commands

- **Lint**: `stylua --check .` (format check, enforced in CI)
- **Format**: `stylua .` (auto-format with 120 char line width, 4 space indent)
- **No tests**: This is a Neovim configuration, no test suite exists

## Code Style Guidelines

- **Language**: Lua for Neovim configuration
- **Indentation**: 4 spaces, Unix line endings (configured in .stylua.toml)
- **Line width**: 120 characters max
- **Variables**: Always use `local`, snake_case naming
- **Keymaps**: Use `vim.keymap.set()` with `{ noremap = true, silent = true, buffer = bufnr }` opts; define global keymaps in `lua/mappings/init.lua`
- **Settings**: Use `vim.opt` / `vim.bo` / `vim.opt_local` — never `nvim_buf_set_option`
- **Plugin configs**: `require("plugin").setup({})` in `lua/<plugin>-config/init.lua`, loaded via lazy.nvim `config` callback

## Architecture

**Load order** (`init.lua`): `settings` → `mappings` → `lazy-config` → `colorschemes-config.default` → `autosession-config`

**Plugin management**: All specs live in `lua/lazy-config/init.lua`. Each plugin has a `config = function() require("<name>-config") end` pointing to its own module. Lazy-loading strategy: `event = "BufReadPost"` for editor enhancements, `cmd =` for tools, `ft =` for filetype-specific, `event = "InsertEnter"` for completion.

**LSP setup** (`lua/lsp-config/lsp.lua`): Uses native Neovim LSP API (`vim.lsp.config[lsp]` + `vim.lsp.enable(lsp)`) — not the lspconfig `setup()` pattern. Add a new server by appending its name to the `servers` table. Capabilities come from `cmp_nvim_lsp`. Formatting on save is handled by none-ls (`lua/lsp-config/null-ls.lua`), not by individual LSP servers (except Rust, which uses rust-analyzer directly via a BufWritePre autocmd).

**Colorscheme switching**: `lua/colorschemes-config/default.lua` is a symlink pointing to whichever theme file is active. To switch themes, retarget the symlink: `ln -sf $(pwd)/lua/colorschemes-config/<theme>.lua lua/colorschemes-config/default.lua`.

**`plugin/` directory**: Autoloaded by Neovim on startup (not lazy). Currently holds `disable-lsp.lua` (blocklist for LSP servers that should never attach) and `signcolumn.lua`.

## Known Workarounds

**Treesitter crash on markdown** (Neovim 0.12.x bug): Opening markdown files with fenced code blocks triggers `attempt to call method 'range' (a nil value)` in `languagetree.lua`. Fixed by two complementary settings:

1. `disable = { "markdown", "markdown_inline" }` in `lua/treesitter-config/init.lua` highlight block — prevents nvim-treesitter from enabling it
2. `vim.treesitter.stop()` FileType autocmd in `lua/settings/init.lua` — prevents Neovim's built-in treesitter from enabling it

Both are required. Remove both when upgrading to a Neovim version that fixes the bug.
