if not pcall(require, "dap") then
    return
end

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dapui.setup({
    sidebar = {
        elements = {
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
        },
        size = 40,
        position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = {},
    },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
