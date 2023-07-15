local M = {
    "nvim-focus/focus.nvim",
    version = false,
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
