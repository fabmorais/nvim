local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
    buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
    buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
    buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
end

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local servers = {
    "pyright",
    "lua_ls",
    "clangd",
    "bashls",
    -- "terraform_lsp"
    "terraformls",
    "tflint",
    "rust_analyzer",
    "yamlls",
    "gopls",
    "golangci_lint_ls",
    "ts_ls",
    "emmet_ls",
    "eslint",
    "quick_lint_js",
    "ltex",
}

for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })
end
