local M = {
    "norcalli/nvim-colorizer.lua",
    dependencies = {
        "norcalli/nvim-terminal.lua",
    },
    config = function() require("terminal").setup() end,
}

return M
