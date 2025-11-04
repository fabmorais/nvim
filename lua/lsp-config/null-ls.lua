local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting

local sources = {
    formatting.stylua,
    formatting.terraform_fmt,
    formatting.black,
    formatting.goimports,
    formatting.shfmt,
    formatting.yamlfmt,
    formatting.prettier,
    formatting.clang_format,
}

null_ls.setup({
    sources = sources,

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        -- timeout_ms = 5000,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end,
})
