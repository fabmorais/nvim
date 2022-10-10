local dashboard = require("dashboard")

local empty_line = [[]]
local header = {
  empty_line,
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  empty_line,
}

dashboard.custom_header = header
dashboard.custom_center = {
  {
    icon = "   ",
    desc = "Find File                                ",
    shortcut = "SPC f f",
    action = "Telescope find_files hidden=true",
  },
  {
    icon = "   ",
    desc = "Recents                                  ",
    shortcut = "SPC f o",
    action = "Telescope oldfiles",
  },
  {
    icon = "   ",
    desc = "Word                                     ",
    shortcut = "SPC f g",
    action = "Telescope live_grep",
  },
  {
    icon = "   ",
    desc = "New File                                 ",
    shortcut = "SPC f n",
    action = "enew",
  },
  {
    icon = "   ",
    desc = "Bookmarks                                ",
    shortcut = "SPC b m",
    action = "Telescope marks",
  },
  {
    icon = "   ",
    desc = "Config                                   ",
    shortcut = "SPC E",
    action = "edit ~/.config/nvim/init.lua",
  },
}
