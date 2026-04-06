-------------------------------------------------------------------------------
-- Theme loader
-------------------------------------------------------------------------------
local settings = require("aw.settings")
local theme = settings.theme

if theme == "oxocarbon" then
    vim.opt.background = "dark"
    vim.cmd("colorscheme oxocarbon")
elseif theme == "kanagawa" then
    require("aw.plugins.themes.kanagawa")
elseif theme == "catppuccin" then
    require("aw.plugins.themes.catppuccin")
elseif theme == "tokyonight" then
    vim.cmd("colorscheme tokyonight")
elseif theme == "github" then
    require("aw.plugins.themes.github")
elseif theme == "rose-pine" then
    require("aw.plugins.themes.rosepine")
else
    -- Default: carbonfox
    require("aw.plugins.themes.carbonfox")
end
