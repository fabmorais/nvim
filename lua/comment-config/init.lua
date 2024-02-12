require("nvim_comment").setup({
	line_mapping = "<leader>/",
	operator_mapping = "<leader>c",
	comment_chunk_text_object = "ic",
	comment_empty = false,

	vim.api.nvim_create_augroup("comment", { clear = true }),

	vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost" }, {
		group = "comment",
		pattern = { "*.tf" },
		callback = function()
			vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
		end,
	}),
})
