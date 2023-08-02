if not vim.g.vscode then return {} end

return {
    { "tpope/vim-repeat" },
    { "folke/flash.nvim", config = "core.lua.plugins.flash" },
    { "numToStr/Comment.nvim", config = "core.lua.plugins.comments" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { highlight = { enable = false } },
    },
}
