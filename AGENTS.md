# AGENTS.md - Neovim Configuration

## Build/Lint/Test Commands
- **Lint**: `stylua --check .` (format check, enforced in CI)
- **Format**: `stylua .` (auto-format with 120 char line width, 4 space indent)
- **No tests**: This is a Neovim configuration, no test suite exists

## Code Style Guidelines
- **Language**: Lua for Neovim configuration
- **Indentation**: 4 spaces, Unix line endings (configured in .stylua.toml)
- **Line width**: 120 characters max
- **Quote style**: Auto-prefer double quotes
- **Variables**: Always use `local`, snake_case naming (e.g., `local keymap = vim.keymap.set`)
- **Functions**: snake_case naming, use local for module-level functions
- **Tables**: Trailing commas required, proper Lua syntax
- **Comments**: Use `--` for single line, `--[[ ]]` for multi-line, `-->` for section headers
- **Keymaps**: Use `vim.keymap.set()` (not `nvim_set_keymap`), define in `lua/mappings/init.lua`
- **Settings**: Use `vim.opt` pattern (e.g., `set = vim.opt; set.expandtab = true`)
- **LSP on_attach**: Use `vim.api.nvim_buf_set_keymap()` for buffer-local keymaps
- **Plugin configs**: Simple `require("plugin").setup({})` calls, minimal abstraction

## Architecture
- **Main entry**: `init.lua` sequentially requires all modules (settings, mappings, lazy-config, then plugins)
- **Module pattern**: Each feature in `lua/[plugin-name]-config/init.lua`
- **No error handling**: Keep configs simple and direct, let Neovim handle errors
- **Plugin management**: Lazy.nvim with plugin specs in `lua/lazy-config/init.lua`
- **Colorschemes**: Default set in `colorschemes-config/default.lua`, others lazy-loaded