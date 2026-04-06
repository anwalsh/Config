-------------------------------------------------------------------------------
-- DAP (Debug Adapter Protocol)
-------------------------------------------------------------------------------
local Config = require("aw.settings")
local dap = require("dap")
local dapui = require("dapui")

-- DAP UI
dapui.setup({})
require("nvim-dap-virtual-text").setup({})

-- Auto open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end

-- Mason DAP integration
require("mason-nvim-dap").setup({
    automatic_installation = true,
    handlers = {},
    ensure_installed = { "codelldb", "delve", "python" },
})

-- DAP signs
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
for name, sign in pairs(Config.icons.dap) do
    sign = type(sign) == "table" and sign or { sign }
    vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
    )
end

-- DAP keymaps
local function get_args(config)
    local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
    config = vim.deepcopy(config)
    config.args = function()
        local new_args = vim.fn.input("Run with args: ", table.concat(args, " "))
        return vim.split(vim.fn.expand(new_args), " ")
    end
    return config
end

-- stylua: ignore start
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>da", function() dap.continue({ before = get_args }) end, { desc = "Run with Args" })
vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
vim.keymap.set("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to line (no execute)" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Down" })
vim.keymap.set("n", "<leader>dk", function() dap.up() end, { desc = "Up" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>dp", function() dap.pause() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>ds", function() dap.session() end, { desc = "Session" })
vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })
vim.keymap.set("n", "<leader>du", function() dapui.toggle({}) end, { desc = "Dap UI" })
vim.keymap.set({ "n", "v" }, "<leader>de", function() dapui.eval() end, { desc = "Eval" })
-- stylua: ignore end
