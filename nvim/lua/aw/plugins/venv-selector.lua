local M = {
    "linux-cultist/venv-selector.nvim",
    config = function()
        require("venv-selector").setup({
            poetry_path = "/Users/andy/Library/Caches/pypoetry/virtualenvs/",
        })
    end,
}

return M
