local dap, dapui = require("dap"), require("dapui")
local daptext = require("nvim-dap-virtual-text")

daptext.setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
