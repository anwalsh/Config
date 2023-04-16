local M = {
    "luukvbaal/stabilize.nvim",   
    lazy = false,
    config = function()
        require("stabilize").setup({
            nested = "QuickFixCmdPost,User LspDiagnosticsChanged",
        })
    end,
}

return M
