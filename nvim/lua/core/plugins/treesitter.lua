local M = {
"nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "mfussenegger/nvim-ts-hint-textobject",
    "windwp/nvim-ts-autotag",
    { "nvim-treesitter/playground", build = ":TSInstall query" },
 "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
      require("core.plugins.treesitter")
  end,
}

return M
