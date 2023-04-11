---@diagnostic disable: undefined-global
local ls = require("luasnip")
local env = ls.get_snip_env()

return {
    env.s({ trig = "pr", name = "print" }, {
        env.t("print("),
        env.i(1),
        env.t(")"),
    }),
    env.s({ trig = "doc", name = "Documentation block" }, {
        env.t([["""]]),
        env.i(1),
        env.t([["""]]),
    }),

    -- class
    env.s(
        "class",
        env.fmt(
            [[class {}({}):
    def __init__(self{}):
        {}{}]],
            { env.i(1, "FooBar"), env.i(2), env.i(3), env.i(4, "pass"), env.i(0) }
        )
    ),
    -- dataclass
    env.s(
        "classd",
        env.fmt(
            [[@dataclass
class {}:
    {}{}]],
            { env.i(1, "FooBar"), env.i(2, "pass"), env.i(0) }
        )
    ),
    -- function
    env.s(
        "def",
        env.fmt(
            [[def {}({}) -> {}:
    {}{}]],
            { env.i(1, "foo_bar"), env.i(2), env.i(3, "None"), env.i(4, "pass"), env.i(0) }
        )
    ),
    -- method
    env.s(
        "defs",
        env.fmt(
            [[def {}(self{}) -> {}:
    {}{}]],
            { env.i(1, "foo_bar"), env.i(2), env.i(3, "None"), env.i(4, "pass"), env.i(0) }
        )
    ),

    -- import ...
    env.s("im", env.fmt("import {}", { env.i(1, "package/module") })),
    -- import ... as ..
    env.s("ima", env.fmt("import {} as {}", { env.i(1, "package/module"), env.i(2, "alias") })),
    -- from ... import ...
    env.s("fim", env.fmt("from {} import {}", { env.i(1, "package/module"), env.i(2, "name") })),
    -- from ... import ... as ...
    env.s("fima", env.fmt("from {} import {} as {}", { env.i(1, "package/module"), env.i(2, "name"), env.i(3) })),

    -- if ...
    env.s(
        { trig = "if", name = "If Statement" },
        env.fmta(
            [[
			if <>:
				<>
			]],
            { env.i(1), env.i(2, "pass") }
        )
    ),
    env.s(
        { trig = "ife", name = "If / Else Statement" },
        env.fmta(
            [[
			if <>:
				<>
			else:
				<>
			]],
            { env.i(1), env.i(2, "pass"), env.i(3, "pass") }
        )
    ),
    env.s(
        { trig = "ifee", name = "If / Elif / Else Statement" },
        env.fmta(
            [[
			if <>:
				<>
			elif <>:
				<>
			else:
				<>
			]],
            { env.i(1, "cond"), env.i(2, "pass"), env.i(3, "cond"), env.i(4, "pass"), env.i(5, "pass") }
        )
    ),

    env.s({ trig = "ifmain", name = "if main" }, {
        env.t([[if __name__ == "__main__":\n]]),
        env.i(1, { "main()" }),
    }),
    env.s(
        { trig = "try", name = "Try/Except" },
        env.fmta(
            [[
			try:
				<>
			except <> as <>:
				<>
			]],
            { env.i(1), env.i(2, "Exception"), env.i(3, "e"), env.i(4, "raise") }
        )
    ),
    env.s(
        { trig = "trye", name = "Try/Except/Else" },
        env.fmta(
            [[
			try:
				<>
			except <> as <>:
				<>
			else:
				<>
			]],
            { env.i(1), env.i(2, "Exception"), env.i(3, "e"), env.i(4, "raise"), env.i(5, "pass") }
        )
    ),
    env.s(
        { trig = "tryf", name = "Try/Except/Finally" },
        env.fmta(
            [[
			try:
				<>
			except <> as <>:
				<>
			finally:
				<>
			]],
            { env.i(1), env.i(2, "Exception"), env.i(3, "e"), env.i(4, "raise"), env.i(5, "pass") }
        )
    ),
    env.s(
        { trig = "tryef", name = "Try/Except/Else/Finally" },
        env.fmta(
            [[
			try:
				<>
			except <> as <>:
				<>
			else:
				<>
			finally:
				<>
			]],
            { env.i(1), env.i(2, "Exception"), env.i(3, "e"), env.i(4, "raise"), env.i(5, "pass"), env.i(6, "pass") }
        )
    ),
    env.s(
        { trig = "skeleton", name = "Python Template" },
        env.fmta(
            [[
			def main():
				<>

			if __name__ == '__main__':
				main()
			]],
            { env.i(1) }
        )
    ),
    -- for-loop
    env.s(
        "for",
        env.fmt(
            [[for {} in {}:
    {}{}]],
            { env.i(1, "elem"), env.i(2, "iterable"), env.i(3, "pass"), env.i(0) }
        )
    ),
    -- for-loop in enumerate
    env.s(
        "fore",
        env.fmt(
            [[for i, {} in enumerate({}):
    {}{}]],
            { env.i(1, "elem"), env.i(2, "iterable"), env.i(3, "pass"), env.i(0) }
        )
    ),
    -- for-loop in range
    env.s(
        "forr",
        env.fmt(
            [[for i in range({}):
    {}{}]],
            { env.i(1, "iterable"), env.i(2, "pass"), env.i(0) }
        )
    ),
}
