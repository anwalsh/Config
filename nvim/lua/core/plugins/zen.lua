local M = {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
        require("zen-mode").setup({
            window = {
                width = 200,
                options = {
                    number = true,
                    relativenumber = true,
                },
            },
            config = {
                plugins = {
                    gitsigns = true,
                },
            },
        })
    end,
}

return M
