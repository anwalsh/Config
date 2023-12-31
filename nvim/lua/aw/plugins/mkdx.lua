local M = {
    "SidOfc/mkdx",
    config = function()
        vim.g["mkdx#settings.restore_visual"] = true
        vim.g["mkdx#settings.map.enable"] = true

        vim.g.markdown_fenced_languages = {
            "lua",
            "html",
            "javascript",
            "typescript",
            "python",
            "bash",
            "go",
            "rust",
        }
        vim.g.markdown_syntax_conceal = false
    end,
}

return M
