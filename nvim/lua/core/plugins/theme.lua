local settings = require("core.settings")

if settings.theme == "oxocarbon" then
    return {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        config = function()
            require("core.plugins.themes.oxocarbon")
        end,
    }
elseif settings.theme == "kanagawa" then
    return {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            require("lua.core.plugins.themes.kanagawa")
        end,
    }
elseif settings.theme == "dracula" then
    return {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function()
            require("lua.core.plugins.themes.dracula")
        end,
    }
elseif settings.theme == "tokyonight" then
    return {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require("lua.core.plugins.themes.tokyonight")
        end,
    }
else
    return {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function()
            require("core.plugins.themes.carbonfox")
        end,
    }
end
