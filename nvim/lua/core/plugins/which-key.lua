local M = {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
        require("core.plugins.which-key.which-key")
        require("core.plugins.which-key.leader")
        require("core.plugins.which-key.g")
    end,
}
return M
