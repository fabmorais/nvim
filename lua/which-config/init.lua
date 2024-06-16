local wk = require("which-key")
wk.setup({
	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false,
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

local toggle_lazygit = function()
	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
	return lazygit:toggle()
end

local mappings = {
	c = {
		name = "Dashboard",
		c = { ":Dashboard<cr>", "Dashboard" },
	},
	q = { ":q<cr>", "Quit" },
	Q = { ":wq<cr>", "Save & Quit" },
	w = { ":w<cr>", "Save" },
	x = { ":bdelete<cr>", "Close" },
	E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
	f = {
		name = "Telescope",
		f = { ":Telescope find_files<cr>", "Telescope find files" },
		g = { ":Telescope live_grep<cr>", "Telescope live grep" },
		o = { ":Telescope oldfiles<cr>", "Telescope find old files" },
		h = { ":Telescope help_tags<cr>", "Telescope help page" },
		b = { ":Telescope buffers<cr>", "Telescope find buffers" },
		m = { ":Telescope marks<CR>", "telescope find marks" },
		z = { ":Telescope current_buffer_fuzzy_find<CR>", "telescope find in current buffer" },
		c = { ":Telescope git_commits<CR>", "telescope git commits" },
		s = { ":Telescope git_status<CR>", "telescope git status" },
	},
	g = {
		name = "ChatGPT",
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		b = { "<cmd>ChatGPTCompleteCode<CR>", "ChatGPTCompleteCode" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
	},
	b = {
		name = "Telescope Bookmarks",
		m = { ":Telescope marks<cr>", "Bookmarks" },
	},
	t = {
		name = "Terminal",
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
	},
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
	},
	p = {
		name = "Packer",
		r = { ":PackerClean<cr>", "Remove Unused Plugins" },
		c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
		i = { ":PackerInstall<cr>", "Install Plugins" },
		p = { ":PackerProfile<cr>", "Packer Profile" },
		s = { ":PackerSync<cr>", "Sync Plugins" },
		S = { ":PackerStatus<cr>", "Packer Status" },
		u = { ":PackerUpdate<cr>", "Update Plugins" },
	},
	-- debugger mappings --
	d = {
		name = "Debugger",
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		s = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			"Set Breakpoint condition",
		},
		B = {
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
			"Set Breakpoint log message",
		},
		n = { "<cmd>lua require'dap'.repl.open()<cr>", "Open" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
	},
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
