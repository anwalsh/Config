-- Use this fioure to make minor changes to the appearance of neovim, unrelated to any particular plugin
local nvim_command = vim.api.nvim_command
local colors = require("anwalsh.global_colors")
local hi = vim.api.nvim_set_hl
local ns = 0

-- Theme Settings
-- NOTE: Needs to be called _before_ the colorscheme is loaded
require("dracula").setup({
    transparent_bg = true,
})

-- vim.g.dracula_transparent_bg = true

-- Load the theme
vim.cmd([[colorscheme dracula]])

-- Other colors
-- General Things
hi(ns, "IncSearch", { fg = colors.orange, bg = colors.background_light })

-- Cursor-related changes
hi(ns, "Cursor", { bg = colors.pink, fg = colors.pink })
hi(ns, "CursorLine", { bg = colors.background })
hi(ns, "CursorWord1", { bg = colors.background_light })
hi(ns, "InsertCursor", { fg = colors.foreground, bg = colors.cyan })
hi(ns, "VisualCursor", { fg = colors.background_dark, bg = colors.orange })
hi(ns, "ReplaceCursor", { fg = colors.foreground, bg = colors.red })
hi(ns, "CommandCursor", { fg = colors.foreground, bg = colors.pink })
hi(ns, "Visual", { bg = colors.background, fg = colors.purple })

nvim_command([[
    set guicursor=n-c:block-Cursor
    set guicursor+=v:block-VisualCursor
    set guicursor+=i:ver100-InsertCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
]])

-- Whichkey
hi(ns, "WhichKeyFloat", { fg = colors.background_dark, bg = colors.background_dark })

-- Telescope 
hi(ns, "TelescopePreviewBorder", { fg = colors.bg_darker })
hi(ns, "TelescopeNormal", { bg = colors.background_darker })
hi(ns, "TelescopeSelection", { bg = colors.background_dark, fg = colors.green })
hi(ns, "TelescopeMatching", { fg = colors.orange, bg = colors.background_dark })
hi(ns, "TelescopePreviewMatch", { fg = colors.orange, bg = colors.background_dark })
hi(ns, "TelescopeMultiSelection", { fg = colors.orange, bg = colors.background_dark })
hi(ns, "TelescopePromptPrefix", { fg = colors.green })
hi(ns, "TelescopeSelection", { fg = colors.purple })

