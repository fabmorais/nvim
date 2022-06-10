local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting

local sources = {
  formatting.eslint,
  formatting.autopep8,
  formatting.stylua,
  formatting.gofmt,
  formatting.goimports,
  formatting.yapf,
  formatting.terrafmt,
  formatting.terraform_fmt,
  formatting.uncrustify,
  formatting.tidy,
  formatting.standardjs,
  formatting.prettier_standard,
  formatting.prettier,
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
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})
