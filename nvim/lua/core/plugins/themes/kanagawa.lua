local colors = require("kanagawa.colors")

require("kanagawa").setup({
    compile = true,
    commentStyle = { italic = true },
    keywordStyle = { bold = true },
})

vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme kanagawa-dragon")
