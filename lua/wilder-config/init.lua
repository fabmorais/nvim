local wilder = require("wilder")
wilder.setup({
    modes = { ":", "/", "?" },
    next_key = "<Tab>",
    previous_key = "<S-Tab>",
    accept_key = "<Down>",
    reject_key = "<Up>",
})
wilder.set_option("pipeline", {
    wilder.branch(
        wilder.python_file_finder_pipeline({
            file_command = function(_, arg)
                if string.find(arg, ".") ~= nil then
                    return { "fd", "-tf", "-H" }
                else
                    return { "fd", "-tf" }
                end
            end,
            dir_command = { "fd", "-td" },
            filters = { "fuzzy_filter", "difflib_sorter" },
        }),
        wilder.cmdline_pipeline(),
        wilder.python_search_pipeline()
    ),
})

wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { " " },
        right = { " ", wilder.popupmenu_scrollbar({ thumb_char = " " }) },
        highlights = { default = "WilderMenu", accent = "WilderAccent" },
    })
)
