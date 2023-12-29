local M = {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    config = function()
        require("neogit").setup({
            disable_signs = false,
            disable_hint = true,
            disable_builtin_notifications = true,
            disable_insert_on_commit = true,
            disable_commit_confirmation = true,
            signs = {
                section = { "", "" },
                item = { "", "" },
                hunk = { "󰐕", "󰍴" },
            },
            commit_popup = {
                kind = "vsplit",
            },
            popup = {
                kind = "split",
            },
            integrations = {
                diffview = true,
            },
            kind = "split",
        })
    end,
}

return M
