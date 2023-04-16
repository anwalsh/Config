---@diagnostic disable: undefined-global
require("luasnip.loaders.from_lua").lazy_load()
local ls = require("luasnip")
local env = ls.get_snip_env()

return {
    env.s("date", env.p(os.date, "%Y-%m-%d")),
    env.s("time", env.p(os.date, "%H:%M")),
    env.s("htime", env.p(os.date, "%Y-%m-%dT%H:%M:%S+10:00")),
}
