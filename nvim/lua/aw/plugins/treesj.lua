local M = {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("treesj").setup({}) end,
}

return M
