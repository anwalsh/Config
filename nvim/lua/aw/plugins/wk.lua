local M = {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
        require("aw.plugins.which-key.which")
        require("aw.plugins.which-key.leader")
        require("aw.plugins.which-key.g")
    end,
}
return M
