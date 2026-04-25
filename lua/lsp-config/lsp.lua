local on_attach = function(client, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
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
    "kotlin_language_server",
}

for _, lsp in ipairs(servers) do
    local default_config = vim.lsp.config[lsp] or {}

    vim.lsp.config[lsp] = vim.tbl_extend("force", default_config, {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })
    vim.lsp.enable(lsp)
end

-- Rust: Enable format on save via rust-analyzer
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.lsp.buf.format({
            async = false,
            filter = function(client)
                return client.name == "rust_analyzer"
            end,
        })
    end,
})
