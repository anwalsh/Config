if not pcall(require, "venv-selector") then return end

require("venv-selector").setup({
    poetry_path = "/Users/andy/Library/Caches/pypoetry/virtualenvs/",
})
