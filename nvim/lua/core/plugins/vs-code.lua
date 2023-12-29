-- The below settings make Leap's highlighting a bit closer to what you've been
-- used to in Lightspeed.
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
vim.api.nvim_set_hl(0, "LeapMatch", {
    fg = "black", -- for light themes, set to 'black' or similar
    bold = true,
    nocombine = true,
})
return {
    {
        "folke/flash.nvim",
        lazy = true,
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function() require("flash").jump() end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc = "Remote Flash",
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        config = function()
            require("Comment").setup({
                -- LHS of operator-pending mapping in NORMAL + VISUAL mode
                opleader = {
                    -- line-comment keymap
                    line = "gc",
                    -- block-comment keymap
                    block = "gb",
                },
                -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
                mappings = {
                    -- operator-pending mapping
                    -- Includes:
                    --  `gcc`               -> line-comment  the current line
                    --  `gcb`               -> block-comment the current line
                    --  `gc[count]{motion}` -> line-comment  the region contained in {motion}
                    --  `gb[count]{motion}` -> block-comment the region contained in {motion}
                    basic = true,
                    -- extra mapping
                    -- Includes `gco`, `gcO`, `gcA`
                    extra = true,
                },
                -- LHS of toggle mapping in NORMAL + VISUAL mode
                toggler = {
                    -- line-comment keymap
                    --  Makes sense to be related to your opleader.line
                    line = "gcc",
                    -- block-comment keymap
                    --  Make sense to be related to your opleader.block
                    block = "gbc",
                },
                -- Pre-hook, called before commenting the line
                --    Can be used to determine the commentstring value
                pre_hook = nil,
                -- Post-hook, called after commenting is done
                --    Can be used to alter any formatting / newlines / etc. after commenting
                post_hook = nil,
                -- Can be used to ignore certain lines when doing linewise motions.
                --    Can be string (lua regex)
                --    Or function (that returns lua regex)
                ignore = nil,
            })

            local comment_ft = require("Comment.ft")
            comment_ft.set("lua", { "--%s", "--[[%s]]" })
        end,
    },
    { "tpope/vim-repeat" },
    { "machakann/vim-sandwich" },
    { "svermeulen/vim-cutlass" },
}
