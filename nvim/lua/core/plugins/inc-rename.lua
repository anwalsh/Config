local M = {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = function() require("inc_rename").setup() end,
}

return M
