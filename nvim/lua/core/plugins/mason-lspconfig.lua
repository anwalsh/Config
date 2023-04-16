local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    lazy = false,
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ltex",
                "marksman",
                "bashls",
                "yamlls",
                "jsonls",
                "dockerls",
                "pyright",
                -- "nimls", // Somehthing is wrong with this one, will need to look into why the server fails
                "terraformls",
                "zls",
            },
        })
    end,
}

return M
