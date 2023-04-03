if not pcall(require, "neogit") then return end

require("neogit").setup({
    disable_commit_confirmation = true,
    signs = {
        section = { "", "" },
        item = { "﬒", "" },
    },
    commit_popup = {
        kind = "split",
    },
    popup = {
        kind = "split",
    },
    integrations = {
        diffview = true,
    },
})
