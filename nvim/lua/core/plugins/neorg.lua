local M = {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false,
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {      -- Manages Neorg workspaces
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
