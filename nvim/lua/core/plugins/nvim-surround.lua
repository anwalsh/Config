local M = {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    lazy = true,
    config = function() require("nvim-surround").setup({}) end,
}

return M
