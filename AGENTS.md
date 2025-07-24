# AGENTS.md - Neovim Configuration

## Build/Lint/Test Commands
- **Lint**: `stylua --check .` (format check)
- **Format**: `stylua .` (auto-format)
- **No tests**: This is a Neovim configuration, no test suite exists

## Code Style Guidelines
- **Language**: Lua for Neovim configuration
- **Indentation**: 4 spaces (set in settings/init.lua)
- **Formatting**: Use StyLua formatter (enforced in CI)
- **Imports**: Use `require("module")` at top of files
- **File structure**: Each plugin config in separate `lua/plugin-config/init.lua`
- **Variables**: Use `local` for all variables, snake_case naming
- **Functions**: snake_case for function names
- **Tables**: Use proper Lua table syntax with trailing commas
- **Comments**: Use `--` for single line, `--[[]]` for multi-line
- **Keymaps**: Define in `lua/mappings/init.lua` using `vim.api.nvim_set_keymap`
- **Settings**: Define in `lua/settings/init.lua` using `vim.opt`
- **LSP**: Configure servers in `lua/lsp-config/lsp.lua`
- **Plugin management**: Use Lazy.nvim (configured in `lua/lazy-config/init.lua`)

## Architecture
- Main entry: `init.lua` requires all modules
- Modular structure: Each feature in separate directory under `lua/`
- Plugin configs: `lua/[plugin-name]-config/init.lua` pattern
- No error handling patterns observed - keep configs simple and direct