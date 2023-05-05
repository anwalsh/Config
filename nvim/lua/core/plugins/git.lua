local M = {
    { "ruifm/gitlinker.nvim", dependencies = "nvim-lua/plenary.nvim" },
    { "rhysd/git-messenger.vim" },
    { "akinsho/git-conflict.nvim" },
    lazy = false,
    config = function()
        require("git-conflict").setup({})
        require("gitlinker").setup()
    end,
}

return M
