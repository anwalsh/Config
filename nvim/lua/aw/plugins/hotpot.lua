local settings = require("aw.settings")
-- Requirement for Fennel (compiler for Oxocarbon)
local M = {
    "rktjmp/hotpot.nvim",
    lazy = false,
}

if settings.theme == "oxocarbon" then
    return M
else
    return {}
end
