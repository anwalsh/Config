-------------------------------------------------------------------------------
-- Neotest
-------------------------------------------------------------------------------
local neotest = require("neotest")

local namespace = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            return diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        end,
    },
}, namespace)

neotest.setup({
    discovery = { enabled = true },
    diagnostic = { enabled = true },
    floating = { border = "rounded" },
    quickfix = { enabled = false, open = true },
    adapters = {
        require("neotest-plenary"),
        require("neotest-go")({ experimental = { test_table = true } }),
        require("neotest-rust")({ args = { "--verbose" } }),
    },
})

-- Keymaps
vim.keymap.set("n", "<localleader>ts", function() neotest.summary.toggle() end, { desc = "neotest: toggle summary" })
vim.keymap.set("n", "<localleader>to", function() neotest.output.open({ enter = true, short = false }) end, { desc = "neotest: output" })
vim.keymap.set("n", "<localleader>tn", function() neotest.run.run() end, { desc = "neotest: run" })
vim.keymap.set("n", "<localleader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "neotest: run file" })
vim.keymap.set("n", "<localleader>tF", function() neotest.run.run({ vim.fn.expand("%"), concurrent = false }) end, { desc = "neotest: run file synchronously" })
vim.keymap.set("n", "<localleader>tc", function() neotest.run.stop({ interactive = true }) end, { desc = "neotest: cancel" })
vim.keymap.set("n", "[n", function() neotest.jump.prev({ status = "failed" }) end, { desc = "jump to next failed test" })
vim.keymap.set("n", "]n", function() neotest.jump.next({ status = "failed" }) end, { desc = "jump to previous failed test" })
