if not vim.filetype then return end

vim.filetype.add({
    extension = {
        lock = "yaml",
    },
    filename = {
        ["NEOGIT_COMMIT_EDITMSG"] = "NeogitCommitMessage",
        [".eslintrc.json"] = "jsonc",
        [".psqlrc"] = "conf",
        ["launch.json"] = "jsonc",
        Podfile = "ruby",
        Brewfile = "ruby",
    },
    pattern = {
        [".*%.conf"] = "conf",
        [".*%.theme"] = "conf",
        [".*%.gradle"] = "groovy",
        ["^.env%..*"] = "bash",
        ["tsconfig*.json"] = "jsonc",
        [".*/%.vscode/.*%.json"] = "jsonc",
        -- Borrowed from LazyVim. Mark huge files to disable features later.
        [".*"] = function(path, bufnr)
            return vim.bo[bufnr]
                    and vim.bo[bufnr].filetype ~= "bigfile"
                    and path
                    and vim.fn.getfsize(path) > (1024 * 500) -- 500 KB
                    and "bigfile"
                or nil
        end,
    },
})
