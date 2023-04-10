local ls = require("luasnip")
local session = require("luasnip.session")

local env = session.config.snip_env
local s = env["s"]
local t = env["t"]
local i = env["i"]
local parse = env["parse"]

ls.add_snippets("go", {
    s({ trig = "co", name = "Constant", dscr = "Insert a constant" }, {
        t("const "),
        i(1, "name"),
        t(" = "),
        i(2, "value"),
    }),

    s({ trig = "pf", name = "Formatted Print", dscr = "Insert a formatted print statement" }, {
        t('fmt.Printf("%+v\\n", '),
        i(1, "value"),
        t(")"),
    }),

    parse(
        { trig = "ife", name = "If Err", dscr = "Insert a basic if err not nil statement" },
        [[
  if err != nil {
    return err
  }
  ]]
    ),

    s({ trig = "ifew", name = "If Err Wrapped", dscr = "Insert a if err not nil statement with wrapped error" }, {
        t("if err != nil {"),
        t({ "", '  return fmt.Errorf("failed to ' }),
        i(1, "message"),
        t(': %w", err)'),
        t({ "", "}" }),
    }),

    parse(
        { trig = "ma", name = "Main Package", dscr = "Basic main package structure" },
        [[
  package main

  import "fmt"

  func main() {
    fmt.Printf("%+v\n", "...")
  }
  ]]
    ),
})
