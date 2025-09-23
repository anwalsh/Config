local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function() require("aw.plugins.treesitter") end,
}

return M
