local settings = require("aw.settings")

if settings.theme == "oxocarbon" then
    return {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.oxocarbon") end,
    }
elseif settings.theme == "kanagawa" then
    return {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.kanagawa") end,
    }
elseif settings.theme == "dracula" then
    return {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.dracula") end,
    }
elseif settings.theme == "catppuccin" then
    return {
        "catppuccin/nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.catppuccin") end,
    }
elseif settings.theme == "tokyonight" then
    return {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.tokyonight") end,
    }
elseif settings.theme == "github" then
    return {
        "projekt0n/github-nvim-theme",
        lazy = false,
        config = function() require("aw.plugins.themes.github") end,
    }
elseif settings.theme == "rose-pine" then
    return {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = function() require("aw.plugins.themes.rosepine") end,
    }
else
    return {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function() require("aw.plugins.themes.carbonfox") end,
    }
end
