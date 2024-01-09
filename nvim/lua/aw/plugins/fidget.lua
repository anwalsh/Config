return {
    "j-hui/fidget.nvim",
    lazy = true,
    config = function()
        require("fidget").setup({
            align = {
                bottom = true,
            },
            window = {
                relative = "editor",
            },
        })
    end,
}
