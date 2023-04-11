---@diagnostic disable: undefined-global
local ls = require("luasnip")
local env = ls.get_snip_env()

return {
    env.snippet({ trig = "co", name = "Constant", dscr = "Insert a constant" }, {
        env.t("const "),
        env.i(1, "name"),
        env.t(" = "),
        env.i(2, "value"),
    }),
    env.snippet({ trig = "pf", name = "Formatted Print", dscr = "Insert a formatted print statement" }, {
        env.t('fmt.Printf("%+v\\n", '),
        env.i(1, "value"),
        env.t(")"),
    }),
    env.snippet({
        trig = "ifew",
        name = "If Err Wrapped",
        dscr = "Insert a if err not nil statement with wrapped error",
    }, {
        env.t("if err != nil {"),
        env.t({ "", '  return fmt.Errorf("failed to ' }),
        env.i(1, "message"),
        env.t(': %w", err)'),
        env.t({ "", "}" }),
    }),
}
