local M = {
    "aaronhallaert/advanced-git-search.nvim",
    "lewis6991/gitsigns.nvim",
    { "ruifm/gitlinker.nvim", dependencies = "nvim-lua/plenary.nvim" },
    { "rhysd/git-messenger.vim" },
    { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim", lazy = false },
    { "akinsho/git-conflict.nvim" },
    lazy = false,
    config = function()
        require("git-conflict").setup({})

        require("gitlinker").setup()

        require("gitsigns").setup({
            current_line_blame = true,
            current_line_blame_formatter = function(name, blame_info)
                if blame_info.author == name then blame_info.author = "You" end

                local text
                if blame_info.author == "Not Committed Yet" then
                    text = blame_info.author
                else
                    text = string.format(
                        "%s, %s - %s",
                        blame_info.author,
                        os.date("%Y-%m-%d", tonumber(blame_info["author_time"])),
                        blame_info.summary
                    )
                end

                return { { "   " .. text, "GitSignsCurrentLineBlame" } }
            end,
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "▍",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn",
                },
                change = {
                    hl = "GitSignsChange",
                    text = "▍",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn",
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "▸",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn",
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "▾",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn",
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "▍",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn",
                },
                untracked = {
                    hl = "GitSignsAdd",
                    text = "▍",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn",
                },
            },
        })
    end,
}

return M
