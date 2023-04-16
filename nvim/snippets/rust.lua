---@diagnostic disable: undefined-global
require("luasnip.loaders.from_lua").lazy_load()
local ls = require("luasnip")
local env = ls.get_snip_env()

return {
    env.s("pl", env.fmt('println!("{}"{})', { env.i(1), env.i(0) })),
    env.s("pf", env.fmt('print!("{}"{})', { env.i(1), env.i(0) })),
    env.s("ep", env.fmt('eprintln!("{}"{})', { env.i(1), env.i(0) })),
    env.s("ase", env.fmt("assert_eq!({})", { env.i(0) })),
    env.s("as", env.fmt("assert!({})", { env.i(0) })),
    env.s("asn", env.fmt("assert_ne!({})", { env.i(0) })),
    env.s("der", env.fmt("#[derive({})]", { env.i(0) })),
    env.s("des", env.t("#[derive(Serialize, Deserialize)]")),
    env.s("re", env.fmt("Result<{}, {}>", { env.i(1), env.i(0) })),
    env.s("op", env.fmt("Option<{}>", { env.i(0) })),
    env.s(
        "test",
        env.fmt(
            [[
#[test]
fn test_{1}() {{
	{2}
}}
]],
            { env.i(1), env.i(0) }
        )
    ),
    env.s(
        "testmod",
        env.fmt(
            [[
#[cfg(test)]
mod tests {{
	use super::*;
{1}
}}
]],
            { env.i(0) }
        )
    ),
    s(
        "bench",
        env.fmt(
            [[
#[bench]
fn bench_{1}() {{
	{2}
}}
]],
            { env.i(1), env.i(0) }
        )
    ),
}
