local M = {
    "SmiteshP/nvim-navic",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("nvim-navic").setup({
            icons = require("nvim-web-devicons"),
            highlight = false,
            separator = " > ",
            depth_limit = 0,
            depth_limit_indicator = "..",
            safe_output = true,
            lsp = {
                auto_attach = true,
            },
        })
    end,
}

return M
