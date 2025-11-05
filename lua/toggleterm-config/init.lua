require("toggleterm").setup({
    size = 13,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    float_opts = {
        border = "curved",
        width = 120,
        height = 30,
        winblend = 3,
    },
})
