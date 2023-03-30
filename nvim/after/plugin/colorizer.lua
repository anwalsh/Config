if not pcall(require, "colorizer") then return end

return {
    "norcalli/nvim-colorizer.lua",
    {
        "norcalli/nvim-terminal.lua",
        config = function() require("terminal").setup() end,
    },
}
