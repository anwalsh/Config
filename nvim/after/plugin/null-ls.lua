if not pcall(require, "null-ls") then
  return
end

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.diagnostics.pylint,
        require("null-ls").builtins.diagnostics.mypy,
        require("null-ls").builtins.diagnostics.pydocstyle,
    },
})
