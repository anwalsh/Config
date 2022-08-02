if not pcall(require, "focus") then
  return
end

require("focus").setup(
    {
        enable = true,
        excluded_filetypes = { 'fterm', 'term', 'toggleterm' },
        bufnew = false,
    }
)
