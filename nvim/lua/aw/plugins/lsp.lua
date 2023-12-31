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
        "simrat39/rust-tools.nvim",
    },
    lazy = false,
    config = function()
        require("aw.plugins.lsp.lsp")
        require("aw.plugins.lsp.dap")
        require("aw.plugins.lsp.code")
        require("aw.plugins.lsp.formatting")
    end,
}

return M
