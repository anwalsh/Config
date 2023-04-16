local M = {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            kb = "~/Gitlocal/github.com/anwalsh/kb",
                        },
                    },
                },
            },
        })
    end,
}

return M
