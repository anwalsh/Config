if not pcall(require, "kanagawa") then return end

local colors = require("kanagawa.colors")
local palette = colors.palette
local hi = vim.api.nvim_set_hl

require("kanagawa").setup({
    compile = true,
    commentStyle = { italic = true },
    theme = "dragon",
    background = {
        dark = "dragon",
    },
})
