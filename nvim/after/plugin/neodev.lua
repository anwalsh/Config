if not pcall(require, "neodev") then
  return
end

require("neodev").setup({
    library = {
        plugins = true,
    },
    lspconfig = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
})
