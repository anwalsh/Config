if not pcall(require, "neorg") then return end

require("neorg").setup({
    load = {
        ["core.defaults"] = {},       -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = {      -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Gitlocal/github.com/anwalsh/kb",
                },
            },
        },
    },
})
