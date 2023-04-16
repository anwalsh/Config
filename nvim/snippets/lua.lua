---@diagnostic disable: undefined-global
require("luasnip.loaders.from_lua").lazy_load()
local ls = require("luasnip")
local env = ls.get_snip_env()

return {
    env.s(
        "pp",
        env.fmt(
            [[
      vim.pretty_print({})
      ]],
            {
                env.i(1, "text"),
            }
        )
    ),
}
