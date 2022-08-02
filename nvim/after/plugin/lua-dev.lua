if not pcall(require, "lua-dev") then
  return
end

require("lua-dev").setup({
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
