-------------------------------------------------------------------------------
-- Lualine
-------------------------------------------------------------------------------
local navic = require("nvim-navic")
local icons = require("aw.settings").icons
local ui = require("aw.util.ui")

vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
    vim.o.statusline = " "
else
    vim.o.laststatus = 0
end

vim.o.laststatus = vim.g.lualine_laststatus

require("lualine").setup({
    options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename" },
        },
        lualine_x = {
            -- stylua: ignore start
            {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = ui.fg("Statement"),
            },
            {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = ui.fg("Constant"),
            },
            {
                function() return "  " .. require("dap").status() end,
                cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                color = ui.fg("Debug"),
            },
            -- stylua: ignore end
            {
                "diff",
                symbols = {
                    added = icons.git.added,
                    modified = icons.git.modified,
                    removed = icons.git.removed,
                },
                source = function()
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed,
                        }
                    end
                end,
            },
        },
        lualine_y = {
            {
                "navic",
                function() return navic.get_location() end,
                cond = function() return navic.is_available() end,
            },
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
    },
    extensions = { "neo-tree" },
})
