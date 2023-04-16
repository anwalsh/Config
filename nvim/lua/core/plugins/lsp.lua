local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "onsails/lspkind-nvim",
        { "williamboman/mason.nvim", build = ":MasonUpdate" },
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim", -- bridge for mason to null-ls
        { "folke/neodev.nvim", config = true },
        "folke/lsp-colors.nvim",
        "folke/lsp-trouble.nvim",
    },
    lazy = false,
    config = function()
        require("core.plugins.lsp.lsp")
        require("core.plugins.lsp.dap")
        require("core.plugins.lsp.code")
        require("core.plugins.lsp.formatting")
    end,
}

return M
