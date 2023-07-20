local M = {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
        require("neogit").setup({
            disable_context_highlighting = true,
            disable_commit_confirmation = true,
            signs = {
                section = { "", "" },
                item = { "", "" },
            },
            commit_popup = {
                kind = "split",
            },
            popup = {
                kind = "split",
            },
            integrations = {
                diffview = true,
            },
        })
    end,
}

return M
