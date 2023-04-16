local M = {
    "stevearc/aerial.nvim",
    config = function()
        require("aerial").setup {
        backends = { "lsp", "treesitter", "markdown" },
        filter_kind = false,
        }
    end,
}

return M
