local M = {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("diffview").setup({
            diff_binaries = false,
            git_cmd = { "git" },
            use_icons = true,
            watch_index = true,
            icons = {
                -- Only applies when use_icons is true.
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
            },
        })
    end,
}

return M
