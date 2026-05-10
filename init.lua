require("settings")
require("mappings")
require("lazy-config")
require("colorschemes-config.default")
require("autosession-config")

local colors_dir = vim.fn.stdpath("config") .. "/lua/colorschemes-config"
local watcher = vim.uv.new_fs_event()
watcher:start(
    colors_dir,
    {},
    vim.schedule_wrap(function(err, fname)
        if err or fname ~= "default.lua" then
            return
        end
        package.loaded["colorschemes-config.default"] = nil
        pcall(require, "colorschemes-config.default")
        vim.cmd("redraw!")
    end)
)
