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
    ["\\"] = {
        "<cmd>ToggleTerm<cr>", "toggleterm"
    },
    ["<leader>"] = {
        ["b"] = {
            name = "+buffer",
            b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
            n = { "<cmd>bn<cr>", "Next Buffer" },
            p = { "<cmd>bp<cr>", "Previous Buffer" },
            d = {
                name = "delete",
                c = { "<Cmd>BufferLinePickClose<CR>", "Choose Buffer to Delete" },
                d = { "<Cmd>BDelete this<CR>", "Delete Current Buffer" },
                h = { "<Cmd>BDelete! hidden<CR>", "Delete Hidden Buffers" },
                n = { "<Cmd>BDelete nameless<CR>", "Delete All Nameless Buggers" },
                o = { "<Cmd>BDelete other<CR>", "Delete Other Buffers" },
                w = { "<Cmd>bufdo Bw<CR>", "Delete All Buffers, Keep Windows" },
            },
            j = { "<C-w>j", "Lower Buffer Split" },
            k = { "<C-w>k", "Upper Buffer Split" },
            l = { "<C-w>l", "Right Buffer Split" },
            h = { "<C-w>h", "Left Buffer Split" },
            o = { "<cmd>FocusMaximise<cr>", "Focus Buffer Only" },
            t = { "<cmd>FocusMaxOrEqual<cr>", "Focus Toggle" },
            H = { "<C-W>5<", "Expand-buffer-left" },
            J = { ":resize +5", "Expand-buffer-below" },
            L = { "<C-W>5>", "Expand-buffer-right" },
            K = { ":resize -5", "Expand-buffer-up" },
        },
        ["d"] = {
            name = "+docs",
            d = {"<cmd>lua require('neogen').generate()<cr>", "Create Docstring"}
        },
        ["f"] = {
            name = "+file",
            b = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            h = { "<cmd>lua require('anwalsh.telescope').find_hidden_files()<cr>", "Find Hidden Files" },
            n = { "<cmd>enew<cr>", "New File" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
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
            d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
            ["G"] = {
                name = "Octo",
                ["p"] = {
                    name = "+pr",
                    p = { "<cmd>Octo pr list<cr>", "List PRs in Current Repository" },
                    c = { "<cmd>Octo pr changes<cr>", "List Changes on PR" },
                    d = { "<cmd>Octo pr diff<cr>", "Show PR Diff" },
                    C = { "<cmd>Octo pr checkout<cr>", "Checkout PR" },
                    r = { "<cmd>Octo pr reload<cr>", "Reload PR" },
                },
                ["r"] = {
                    name = "+repo",
                    b = { "<cmd>Octo repo browser<cr>", "Open repo in browser" },
                },
                ["R"] = {
                    name = "+review",
                    r = { "<cmd>Octo review start<cr>", "Start Review" },
                    s = { "<cmd>Octo review submit<cr>", "Submit Review" },
                    R = { "<cmd>Octo review resume<cr>", "Resume Review" },
                    D = { "<cmd>Octo review discard<cr>", "Discard Review" },
                    c = { "<cmd>Octo review comments<cr>", "View Review Comments" },
                },
                s = { "<cmd>Octo search<cr>", "Search GH" },
                g = { "<cmd>Octo gist list<cr>", "List gists" },
                i = { "<cmd>Octo issue list<cr>", "List Issues in GitHub" },
                a = { "<cmd>Octo actions<cr>", "List Octo Actions" },
            },
            y = { "<cmd>lua require('gitlinker').get_buf_range_url(n)<cr>", "Git Link to Line" }
        },
		["H"] = {
			name = "+hop",
			["c"] = { "<cmd>HopChar1<cr>", "Hop to single char" },
			["C"] = { "<cmd>HopChar2<cr>", "Hop to bigram" },
			["l"] = { "<cmd>HopLine<cr>", "Hop to line" },
			["L"] = { "<cmd>HopLineStart<cr>", "Hop to line start" },
			["p"] = { "<cmd>HopPattern<cr>", "Hop to pattern" },
			["w"] = { "<cmd>HopWord<cr>", "Hop to word" },
        },
        ["p"] = {
            name = "+project",
            f = { "<cmd>lua require('anwalsh.telescope').project_search()<cr>", "Open Project File" },
            p = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Project Finder" },
        },
        ["s"] = {
            name = "+search",
            s = {
                  function()
                    require("telescope.builtin").lsp_document_symbols({
                      symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait" },
                    })
                  end,
                  "Goto Symbol",
                },
			b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			f = { "<cmd>Telescope find_files<cr>", "Find file" },
			g = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			h = { "<cmd>Telescope command_history<cr>", "Find command history" },
			H = { "<cmd>Telescope help_tags<cr>", "Find help" },
			L = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			m = { "<cmd>Telescope marks<cr>", "Marks" },
			M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
			o = { "<cmd>Telescope oldfiles<cr>", "Open old files" },
			r = { "<cmd>Telescope resume<cr>", "Open previous search" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			p = { "<cmd>TodoTelescope<cr>", "Open TODO comments" },
			P = { "<cmd>Telescope zoxide list<cr>", "Open projects" },
			t = { "<cmd>Telescope live_grep<cr>", "Text without args" },
			w = { "<cmd>Telescope grep_string<cr>", "Word under cursor" },
        },
        ["t"] = {
            name = "+text",
            ["r"] = {
                name = "+replace",
                m = { "<cmd>lua require('spectre').open()<CR>", "Open menu" },
                f = {
                    "<cmd>lua require('spectre').open_file_search()<CR>",
                    "Open file menu",
                },
                w = {
                    "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
                    "Replace word under cursor",
                },
            },
        },
        u = { "<cmd>UndotreeToggle<cr>", "undo Tree" },
        w = { "<cmd> :w<cr>", "write File" },
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
        ["x"] = {
            name = "+tooling",
            x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
            t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
            T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
            l = { "<cmd>lopen<cr>", "Open Location List" },
            q = { "<cmd>copen<cr>", "Open Quickfix List" },
        },
    },
})

-- TODO Local leader/keybind env for Markdown? Or Markdown top level?
