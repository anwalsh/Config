local M = {
    "j-hui/fidget.nvim",
    branch = "legacy",
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
