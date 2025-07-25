local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal

local toggle_float = function()
    local float = Terminal:new({ direction = "float" })
    return float:toggle()
end

local toggle_lazygit = function()
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
    return lazygit:toggle()
end

wk.add({
    -- General
    {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    },
    -- Dashboard
    { "<leader>c", group = "Dashboard" }, -- group
    {
        "<leader>cb",
        ":Dashboard<cr>",
        desc = "Open dashboard",
        mode = "n",
    },
    -- Terminal
    { "<leader>t", group = "Terminal" }, -- group
    {
        "<leader>tt",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        desc = "Split Below",
        mode = "n",
    },
    {
        "<leader>tr",
        "<cmd>ToggleTerm direction=vertical size=60<cr>",
        desc = "Split right",
        mode = "n",
    },
    {
        "<leader>tf",
        toggle_float,
        desc = "Floating Terminal",
        mode = "n",
    },
    {
        "<leader>tl",
        toggle_lazygit,
        desc = "LazyGit",
        mode = "n",
    },
    -- Close Buffer
    {
        "<leader>x",
        "<cmd>bdelete<cr>",
        desc = "Close window",
        mode = "n",
    },
    -- Telescope
    { "<leader>f", group = "File" }, -- group
    {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find File",
        mode = "n",
    },
    {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live Grep",
        mode = "n",
    },
    {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Buffers",
        mode = "n",
    },
    {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help",
        mode = "n",
    },
    {
        "<leader>fk",
        "<cmd>Telescope keymaps<cr>",
        desc = "Keymaps",
        mode = "n",
    },
    {
        "<leader>fo",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Find Recent",
        mode = "n",
    },
    {
        "<leader>fd",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Diagnostics",
        mode = "n",
    },
    {
        "<leader>fm",
        "<cmd>Telescope marks<cr>",
        desc = "Marks",
        mode = "n",
    },
    {
        "<leader>fr",
        "<cmd>Telescope grep_string<cr>",
        desc = "Find Word",
        mode = "n",
    },

    -- LSP
    { "<leader>l", group = "Lsp" }, -- group
    {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "Connected Language Servers",
        mode = "n",
    },
    {
        "<leader>lR",
        "<cmd>Lspsaga rename<cr>",
        desc = "Rename",
        mode = "n",
    },
    {
        "<leader>la",
        "<cmd>Lspsaga code_action<cr>",
        desc = "Code Action",
        mode = "n",
    },
    {
        "<leader>ln",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "Go To Next Diagnostic",
        mode = "n",
    },
    {
        "<leader>lN",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "Go To Previous Diagnostic",
        mode = "n",
    },
    {
        "<leader>lr",
        "<cmd>lua vim.lsp.buf.references()<cr>",
        desc = "References",
        mode = "n",
    },
    {
        "<leader>le",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        desc = "Show Line Diagnostics",
        mode = "n",
    },
    {
        "<leader>lt",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        desc = "Type Definition",
        mode = "n",
    },
    {
        "<leader>ld",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        desc = "Go To Definition",
        mode = "n",
    },
    {
        "<leader>lD",
        "<cmd>lua vim.lsp.buf.declaration()<cr>",
        desc = "Go To Declaration",
        mode = "n",
    },
    {
        "<leader>lk",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        desc = "Signature Help",
        mode = "n",
    },
    {
        "<leader>lh",
        "<cmd>lua vim.lsp.buf.hover()<cr>",
        desc = "Hover",
        mode = "n",
    },
    {
        "<leader>ll",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        desc = "List Workspace Folders",
        mode = "n",
    },
    {
        "<leader>lw",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        desc = "Add Workspace Folder",
        mode = "n",
    },
    {
        "<leader>lW",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        desc = "Remove Workspace Folder",
        mode = "n",
    },

    -- Debugger
    { "<leader>d", group = "Debugger" }, -- group
    {
        "<leader>dc",
        "<cmd>lua require'dap'.continue()<cr>",
        desc = "Continue",
        mode = "n",
    },
    {
        "<leader>do",
        "<cmd>lua require'dap'.step_over()<cr>",
        desc = "Step Over",
        mode = "n",
    },
    {
        "<leader>di",
        "<cmd>lua require'dap'.step_into()<cr>",
        desc = "Step Into",
        mode = "n",
    },
    {
        "<leader>dO",
        "<cmd>lua require'dap'.step_out()<cr>",
        desc = "Step Out",
        mode = "n",
    },
    {
        "<leader>db",
        "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
        desc = "Toggle Breakpoint",
        mode = "n",
    },
    {
        "<leader>ds",
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        desc = "Set Breakpoint condition",
        mode = "n",
    },
    {
        "<leader>dB",
        "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
        desc = "Set Breakpoint log message",
        mode = "n",
    },
    {
        "<leader>dn",
        "<cmd>lua require'dap'.repl.open()<cr>",
        desc = "Open",
        mode = "n",
    },
    {
        "<leader>dl",
        "<cmd>lua require'dap'.run_last()<cr>",
        desc = "Run Last",
        mode = "n",
    },

    -- Git
    { "<leader>r", group = "Git" }, -- group
    {
        "<leader>rc",
        "<cmd>Telescope git_commits<CR>",
        desc = "Git commits",
        mode = "n",
    },
    {
        "<leader>rz",
        "<cmd>Telescope git_status<CR>",
        desc = "Git status",
        mode = "n",
    },
    {
        "<leader>rs",
        "<cmd>lua require 'gitsigns'.stage_buffer()<cr>",
        desc = "Stage Buffer",
        mode = "n",
    },
    {
        "<leader>rg",
        "<cmd>lua require 'gitsigns'.status()<cr>",
        desc = "Status",
        mode = "n",
    },
    {
        "<leader>rb",
        "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        desc = "Blame Line",
        mode = "n",
    },
    { "<leader>rt", "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>", desc = "Toggle Blame" },
    { "<leader>rr", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>ru", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>rp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>rd", "<cmd>lua require 'gitsigns'.diffthis()<cr>", desc = "Diff This" },
    { "<leader>rD", "<cmd>lua require 'gitsigns'.diffthis('~')<cr>", desc = "Diff This ~" },
    { "<leader>rh", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>rH", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>rS", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>rk", "<cmd>lua require 'gitsigns'.toggle_deleted()<cr>", desc = "Toggle Deleted" },
})
