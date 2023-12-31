local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    lazy = false,
    config = function()
        local settings = require("aw.settings")
        require("mason-lspconfig").setup({
            ensure_installed = settings.mason_ensure_installed,
        })
    end,
}

return M
