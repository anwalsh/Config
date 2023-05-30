local settings = require("core.settings")

if settings.theme == "oxocarbon" then
    return {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        config = function() require("core.plugins.themes.oxocarbon") end,
    }
elseif settings.theme == "kanagawa" then
    return {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function() require("core.plugins.themes.kanagawa") end,
    }
elseif settings.theme == "dracula" then
    return {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function() require("core.plugins.themes.dracula") end,
    }
elseif settings.theme == "catppuccin" then
    return {
        "catppuccin/nvim",
        lazy = false,
        config = function() require("core.plugins.themes.catppuccin") end,
    }
elseif settings.theme == "tokyonight" then
    return {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function() require("core.plugins.themes.tokyonight") end,
    }
elseif settings.theme == "github" then
    return {
        "projekt0n/github-nvim-theme",
        lazy = false,
        config = function() require("core.plugins.themes.github") end,
    }
else
    return {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function() require("core.plugins.themes.carbonfox") end,
    }
end
