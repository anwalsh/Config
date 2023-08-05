if not vim.g.vscode then
    return {}
else
    local M = {
        { "numToStr/Comment.nvim", config = function() require("Comment").setup({}) end },
        {
            "ggandor/leap.nvim",
            config = function() require("leap").add_default_mappings() end,
        },
    }

    return M
end
