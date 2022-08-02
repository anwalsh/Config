if not pcall(require, "aerial") then
  return
end

require("aerial").setup {
    backends = { "lsp", "treesitter", "markdown" },
    filter_kind = false,
}
