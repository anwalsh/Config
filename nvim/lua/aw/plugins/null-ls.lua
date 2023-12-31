local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function() require("aw.plugins.lsp.null-ls") end,
    lazy = false,
}

return M
