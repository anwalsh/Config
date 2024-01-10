local M = {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
        require("aw.plugins.which-key.which")
        require("aw.plugins.which-key.leader")
    end,
}
return M
