local M = {
    "tpope/vim-abolish",
    event = "CmdlineEnter",
    keys = {
        {
            "<localleader>[",
            ":S/<C-R><C-W>//<LEFT>",
            mode = "n",
            silent = false,
            desc = "abolish: replace word under the cursor (line)",
        },
        {
            "<localleader>]",
            ":%S/<C-r><C-w>//c<left><left>",
            mode = "n",
            silent = false,
            desc = "abolish: replace word under the cursor (file)",
        },
        {
            "<localleader>[",
            [["zy:'<'>S/<C-r><C-o>"//c<left><left>]],
            mode = "x",
            silent = false,
            desc = "abolish: replace word under the cursor (visual)",
        },
    },
}

return M
