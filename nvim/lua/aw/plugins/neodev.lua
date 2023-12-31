local M = {
    "folke/neodev.nvim",
    config = function()
        require("neodev").setup({
            library = {
                plugins = true,
            },
            lspconfig = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },
        })
    end,
}

return M
