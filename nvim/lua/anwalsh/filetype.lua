if not vim.filetype then return end

vim.filetype.add({
    filename = {
        ["NEOGIT_COMMIT_EDITMSG"] = "NeogitCommitMessage",
    },
})
