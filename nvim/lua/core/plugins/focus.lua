local M = {
    "beauwilliams/focus.nvim",
    lazy = false,
    config = function()
        require("focus").setup({
            enable = true,
            excluded_filetypes = { "fterm", "term", "toggleterm" },
            bufnew = false,
        })
    end,
}

return M
