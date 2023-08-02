local M = {
    "cappyzawa/trim.nvim",
    event = "BufWritePre",
    config = true,
    opts = {
        ft_blocklist = { "gitcommit" },
    },
}

return M
