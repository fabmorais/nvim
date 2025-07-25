require("chatgpt").setup({
    api_key_cmd = "op read op://private/OpenAI/credential --no-newline",
    openai_params = {
        model = "gpt-4-turbo",
    },
    buf_options = { filetype = "markdown" },
})
