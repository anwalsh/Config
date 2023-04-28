local M = {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
        require("fidget").setup({
            align = {
                bottom = true,
            },
            window = {
                relative = editor,
            },
        })
    end,
}

return M
