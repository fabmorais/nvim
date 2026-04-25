# nvim config

Personal Neovim configuration for daily development. Built on [lazy.nvim](https://github.com/folke/lazy.nvim) with a focus on LSP, fast startup via lazy-loading, and a clean editing experience.

## Stack

| Category           | Plugin                             |
| ------------------ | ---------------------------------- |
| Plugin manager     | lazy.nvim                          |
| File explorer      | nvim-tree                          |
| Bufferline         | barbar.nvim                        |
| Statusline         | lualine                            |
| Fuzzy finder       | Telescope                          |
| Syntax             | nvim-treesitter                    |
| LSP                | nvim-lspconfig + Mason             |
| Formatting/Linting | none-ls (null-ls fork)             |
| Completion         | nvim-cmp + LuaSnip                 |
| Debugging          | nvim-dap                           |
| Git                | gitsigns + vim-fugitive + diffview |
| AI                 | GitHub Copilot                     |
| Session            | auto-session                       |
| Colorscheme        | Dracula (default) + many extras    |

## Structure

```
init.lua                  # entry point — requires all modules in order
lua/
  settings/               # vim options
  mappings/               # keymaps
  lazy-config/            # plugin specs
  lsp-config/             # LSP, completion, none-ls, lspsaga
  treesitter-config/      # treesitter setup
  colorschemes-config/    # default colorscheme + extras
  *-config/               # one directory per plugin
plugin/                   # autoloaded vim scripts
```

## Keymaps

**Leader: `<Space>`**

### Navigation

| Key               | Action                    |
| ----------------- | ------------------------- |
| `<leader>e`       | Toggle file explorer      |
| `<C-h/j/k/l>`     | Move between windows      |
| `<C-d>` / `<C-u>` | Scroll down/up (centered) |

### Buffers (barbar)

| Key               | Action                       |
| ----------------- | ---------------------------- |
| `<A-,>` / `<A-.>` | Previous / Next buffer       |
| `<A-1..9>`        | Go to buffer N               |
| `<A-c>`           | Close buffer                 |
| `<A-p>`           | Pin/unpin buffer             |
| `<C-p>`           | Buffer pick mode             |
| `<Space>bb`       | Close all but current/pinned |

### Editing

| Key                | Action                              |
| ------------------ | ----------------------------------- |
| `<leader>/`        | Toggle comment                      |
| `<A-Up/Down>`      | Move line/selection up or down      |
| `<` / `>` (visual) | Indent left/right (stays in visual) |
| `<leader>va`       | Select entire file                  |
| `<C-y>`            | Copy entire file to clipboard       |
| `<C-J>` (insert)   | Accept Copilot suggestion           |

### LSP (on attach)

| Key         | Action                     |
| ----------- | -------------------------- |
| `gd`        | Go to definition           |
| `gi`        | Go to implementation       |
| `gr`        | References                 |
| `[d` / `]d` | Previous / Next diagnostic |

## Languages

LSP + formatting configured for: **Lua, Python, Go, Rust, TypeScript, Bash, Terraform, YAML, Kotlin, C/C++**

Parsers (treesitter): all of the above + Markdown, HTML, CSS, TOML, Vim.

## Installation

> Backs up any existing config before cloning.

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/fabmorais/nvim ~/.config/nvim
nvim
```

On first launch, lazy.nvim will bootstrap itself and install all plugins automatically. Then run `:MasonUpdate` to install language servers.

## Usage

| Command                 | Description                         |
| ----------------------- | ----------------------------------- |
| `:Mason`                | Open Mason UI to manage LSP servers |
| `:Lazy`                 | Open plugin manager                 |
| `:Telescope find_files` | Find files                          |
| `:Telescope live_grep`  | Grep across project                 |
| `:DiffviewOpen`         | Open git diff view                  |
| `:UndotreeToggle`       | Browse undo history                 |
| `:ToggleTerm`           | Toggle floating terminal            |

## Requirements

- Neovim >= 0.11
- `git`, `make`, `gcc` (for treesitter parser compilation)
- A [Nerd Font](https://www.nerdfonts.com/) in your terminal
- Language servers installed via `:Mason`
