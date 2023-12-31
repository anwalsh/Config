local M = {
    "SmiteshP/nvim-navic",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("nvim-navic").setup({
            icons = require("aw.settings").icons.kinds,
            highlight = false,
            separator = " > ",
            depth_limit = 5,
            depth_limit_indicator = "..",
            safe_output = true,
            lsp = {
                auto_attach = true,
            },
        })
    end,
}

return M
