local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    lazy = false,
    config = function()
        require("lualine").setup({
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            winbar = {
                lualine_c = { {
                    "filename",
                    path = 1,
                } },
            },
        })
    end,
}

return M
