local M = {
    "aaronhallaert/ts-advanced-git-search.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- to show diff splits and open commits in browser
        "tpope/vim-fugitive",
    },
    config = function() require("telescope").load_extension("advanced_git_search") end,
}

return M
