if not pcall(require, "oxocarbon") then return end

vim.opt.background = "dark"

local hi = vim.api.nvim_set_hl

local palette = require("nightfox.palette").load("nightfox")

-- Cursor-related changes
hi(0, "Cursor", { bg = palette.pink.bright, fg = palette.pink.bright })
hi(0, "InsertCursor", { fg = palette.fg1, bg = palette.cyan.bright })
hi(0, "VisualCursor", { fg = palette.bg1, bg = palette.orange.bright })
hi(0, "CursorLine", { bg = palette.bg1 }) -- don't show the cursor line

-- Window Borders
hi(0, "VertSplit", { fg = palette.sel0 })
