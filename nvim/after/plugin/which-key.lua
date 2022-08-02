if not pcall(require, "which-key") then
  return
end

require("which-key").setup {}

local wk = require("which-key")

wk.register({
    ["1"] = { [[<Plug>(cokeline-focus-1)]], "which_key_ignore" },
    ["2"] = { [[<Plug>(cokeline-focus-2)]], "which_key_ignore" },
    ["3"] = { [[<Plug>(cokeline-focus-3)]], "which_key_ignore" },
    ["4"] = { [[<Plug>(cokeline-focus-4)]], "which_key_ignore" },
    ["5"] = { [[<Plug>(cokeline-focus-5)]], "which_key_ignore" },
    ["6"] = { [[<Plug>(cokeline-focus-6)]], "which_key_ignore" },
    ["7"] = { [[<Plug>(cokeline-focus-7)]], "which_key_ignore" },
    ["8"] = { [[<Plug>(cokeline-focus-8)]], "which_key_ignore" },
    ["9"] = { [[<Plug>(cokeline-focus-9)]], "which_key_ignore" },
    [";"] = {
        "<cmd>ToggleTerm<cr>", "toggleterm"
    },
    ["<leader>"] = {
        ["b"] = {
            name = "+buffer",
            n = { "<cmd>bn<cr>", "Next Buffer" },
            p = { "<cmd>bp<cr>", "Previous Buffer" },
            d = { 
                name = "delete",
                d = { "<cmd>b#<bar>bd#<CR>", "Close Buffer" },
                c = { "<Cmd>BufferLinePickClose<CR>", "Choose Buffer to Delete" },
                d = { "<Cmd>BDelete this<CR>", "Delete Current Buffer" },
                h = { "<Cmd>BDelete! hidden<CR>", "Delete Hidden Buffers" },
                n = { "<Cmd>BDelete nameless<CR>", "Delete All Nameless Buggers" },
                o = { "<Cmd>BDelete other<CR>", "Delete Other Buffers" },
                w = { "<Cmd>bufdo Bw<CR>", "Delete All Buffers, Keep Windows" },
            },
        },
        ["f"] = {
            name = "+file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            s = { "<cmd>Telescope grep_string<cr>", "Find String" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        },
        ["g"] = {
            name = "+git",
            b = { "<cmd>lua require('anwalsh.telescope').git_branches()<cr>", "Git Branches" },
            s = { "<cmd>Neogit<cr>", "Neogit Status" },
            ["n"] = {
                name = "+neogit",
                    f = { "<cmd>lua require('neogit').neogit.popups.pull.create()<cr>", "Neogit Pull Create" },
                    p = { "<cmd>lua require('neogit').popups.push.create()<cr>", "Neogit Push Create" },
                },
            f = { "<cmd>lua require('neogit').neogit.popups.pull.create()<cr>", "Neogit Pull Create" },
            p = { "<cmd>lua require('neogit').popups.push.create()<cr>", "Neogit Push Create" },
            l = {
              function()
                require("anwalsh.telescope").float_terminal("lazygit")
              end,
              "LazyGit",
            },
            G = {
                name = "Octo",
                b = { "<Cmd>Octo repo browser<cr>", "Open repo in browser" },
                g = { "<Cmd>Octo gist list<cr>", "List gists" },
                i = { "<Cmd>Octo issue list<cr>", "List Issues in GitHub" },
                p = { "<Cmd>Octo pr list<cr>", "List PRs in Current Repository" },
                P = { "<Cmd>Octo pr browser<cr>", "List PRs in Current Repository" },
            },
        },
        ["p"] = {
            name = "+project",
            f = { "<cmd>lua require('anwalsh.telescope').project_search()<cr>", "Open Project File" },
            p = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Project Finder" },
        },
        ["s"] = {
            name = "+search",
            g = { "<cmd>Telescope live_grep<cr>", "Grep" },
            b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
            s = {
                  function()
                    require("telescope.builtin").lsp_document_symbols({
                      symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait" },
                    })
                  end,
                  "Goto Symbol",
                },
            h = { "<cmd>Telescope command_history<cr>", "Command History" },
            m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
        },
        u = { "<cmd>UndotreeToggle<cr>", "undo Tree" },
        ["w"] = {
            name = "+window",
            j = { "<C-w>j", "Lower Window" },
            k = { "<C-w>k", "Upper Window" },
            l = { "<C-w>l", "Right Window" },
            h = { "<C-w>h", "Left Window" },
            o = { "<cmd>FocusMaximise<cr>", "Focus Window Only" },
            t = { "<cmd>FocusMaxOrEqual<cr>", "Focus Toggle" },
            H = { "<C-W>5<", "Expand-window-left" },
            J = { ":resize +5", "Expand-window-below" },
            L = { "<C-W>5>", "Expand-window-right" },
            K = { ":resize -5", "Expand-window-up" },
        },
        h = { "<cmd>lua require'focus'.split_command('h')<cr>", "Focus Left" },
        l = { "<cmd>lua require'focus'.split_command('l')<cr>", "Focus Right" },
        k = { "<cmd>lua require'focus'.split_command('k')<cr>", "Focus Up" },
        j = { "<cmd>lua require'focus'.split_command('j')<cr>", "Focus Down" },
        ["?"] = {
            name = "+help",
            t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
            c = { "<cmd>:Telescope commands<cr>", "Commands" },
            h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
            m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
            k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
            s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
            l = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
            f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
            o = { "<cmd>:Telescope vim_options<cr>", "Options" },
            a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
        },
        [","] = {
            name = "+settings",
            -- TODO set this up
        },
    },
})
