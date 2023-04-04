local hi = vim.api.nvim_set_hl

require("kanagawa").setup({
    compile = true,
    commentStyle = { italic = true },
    dimInactive = true,
    theme = "dragon",
})

vim.cmd([[colorscheme carbonfox]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme oxocarbon]])
-- vim.cmd([[colorscheme kanagawa]])

if "carbonfox" == vim.g.colors_name then
    local palette = require("nightfox.palette").load("nightfox")

    vim.cmd([[
        " Don't highlight word under cursor when using mini.cursor plugin module
        hi! link MiniCursorword Visual
        hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE
    ]])

    -- Cursor-related changes
    hi(0, "Cursor", { bg = palette.pink.bright, fg = palette.pink.bright })
    hi(0, "InsertCursor", { fg = palette.fg1, bg = palette.cyan.bright })
    hi(0, "VisualCursor", { fg = palette.bg1, bg = palette.orange.bright })
    hi(0, "CursorLine", { bg = palette.bg1 }) -- don't show the cursor line

    -- Window Borders
    hi(0, "VertSplit", { fg = palette.sel0 })

    require("nightfox").setup({
        options = {
            transparent = true,
            styles = {
                comments = "italic",
            },
        },
    })
end

vim.opt.background = "dark"

if "kanagawa" == vim.g.colors_name then
    vim.opt.background = nil

    local colors = require("kanagawa.colors").setup()
    local palette = colors.palette

    vim.cmd([[
        " Don't highlight word under cursor when using mini.cursor plugin module
        hi! link MiniCursorword Visual
        hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE
    ]])

    -- Cursor-related changes
    hi(0, "Cursor", { bg = palette.dragonPink, fg = palette.dragonPink })
    hi(0, "InsertCursor", { fg = palette.oldWhite, bg = palette.dragonBlue })
    hi(0, "VisualCursor", { fg = palette.dragonBlack0, bg = palette.dragonGreen })
    hi(0, "CursorLine", { bg = palette.dragonBlack0 }) -- don't show the cursor line

    -- Window Borders
    hi(0, "VertSplit", { fg = palette.dragonBlack6 })
end
