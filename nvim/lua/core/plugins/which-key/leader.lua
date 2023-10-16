local wk = require("which-key")

wk.register({
    [","] = {
        w = { ":w<cr>", "which_key_ignore" },
    },
    ["<TAB>"] = { "<Cmd>edit #<CR>", "Previously Edited Buffer" },
    ["<S-TAB>"] = { ":bprevious<CR>", "Jump to prev buffer" },
    ["<C-h>"] = { "<C-w>h", "Jump window left" },
    ["<C-j>"] = { "<C-w>j", "Jump window down" },
    ["<C-k>"] = { "<C-w>k", "Jump window up" },
    ["<C-l>"] = { "<C-w>l", "Jump window right" },
    ["<leader>"] = {
        ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "which_key_ignore" },
        ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "which_key_ignore" },
        ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "which_key_ignore" },
        ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "which_key_ignore" },
        ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "which_key_ignore" },
        ["/"] = { "<cmd>Telescope live_grep<cr>", "Text without args" },
        ["q"] = { ":q<cr>", "Quit" },
        [" "] = { "<Cmd>Legendary<CR>", "Search All Commands" },
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
                n = { "<Cmd>BDelete nameless<CR>", "Delete All Nameless Buffers" },
                o = { "<Cmd>BDelete other<CR>", "Delete Other Buffers" },
                w = { "<Cmd>bufdo Bw<CR>", "Delete All Buffers, Keep Windows" },
            },
            N = { "<Cmd>enew<CR>", "New Empty Buffer" },
            m = { "<Cmd>messages<CR>", "Show 'messages' Buffer" },
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
        ["B"] = {
            name = "+bookmarks",
            a = { "<cmd>lua require('harpoon.mark').add_file()<cr>,", "Harpoon Add File" },
            s = { "<cmd>Telescope harpoon marks<cr>", "Search Harpoon Marks" },
            A = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
            c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
            t = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
            j = { "<cmd>silent BookmarkNext<cr>", "Next" },
            k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
            S = { "<cmd>Telescope vim_bookmarks all<cr>", "Show All Bookmarks" },
            x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
        },
        ["f"] = {
            name = "+file",
            b = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            h = { "<cmd>lua require('core.plugins.telescope').find_hidden_files()<cr>", "Find Hidden Files" },
            n = { "<cmd>enew<cr>", "New File" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            s = { "<Cmd>w<CR>", "Save Current File" },
            S = { "<Cmd>wa<CR>", "Save All Open Files" },
            t = { "<Cmd>Neotree toggle right<CR>", "Show NeoTree" },
            T = { "<Cmd>Neotree toggle show buffers right<CR>", "Find Current Buffers in NeoTree" },
        },
        ["d"] = {
            name = "+debug",
            t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
            C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
            d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
            g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
            i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
            o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
            u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
            p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
            r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
            q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
            Q = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
        },
        ["g"] = {
            name = "+git",
            b = { "<cmd>lua require('core.plugins.telescope').git_branches()<cr>", "Git Branches" },
            s = { "<cmd>Neogit<cr>", "Neogit Status" },
            ["n"] = {
                name = "+neogit",
                f = { "<cmd>lua require('neogit').neogit.popups.pull.create()<cr>", "Neogit Pull Create" },
                p = { "<cmd>lua require('neogit').popups.push.create()<cr>", "Neogit Push Create" },
            },
            f = { "<cmd>lua require('neogit').neogit.popups.pull.create()<cr>", "Neogit Pull Create" },
            P = { "<cmd>lua require('neogit').popups.push.create()<cr>", "Neogit Push Create" },
            d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
            ["m"] = {
                name = "Merge Conflict",
                l = { "<cmd>GitConflictListQf<cr>", "List of Conflicts" },
                o = { "<Plug>(git-conflict-ours)", "Choose our change" },
                t = { "<Plug>(git-conflict-theirs)", "Choose their change" },
                b = { "<Plug>(git-conflict-both)", "Choose both changes" },
                n = { "<Plug>(git-conflict-none)", "Choose neither change" },
                ["]"] = { "<Plug>(git-conflict-prev-conflict)", "Previous Conflict" },
                ["["] = { "<Plug>(git-conflict-prev-conflict)", "Next Conflict" },
            },
            ["G"] = {
                name = "Octo",
                ["p"] = {
                    name = "+pr",
                    l = { "<cmd>Octo pr list<cr>", "List PRs in Current Repository" },
                    c = { "<cmd>Octo pr changes<cr>", "List Changes on PR" },
                    d = { "<cmd>Octo pr diff<cr>", "Show PR Diff" },
                    C = { "<cmd>Octo pr checkout<cr>", "Checkout PR" },
                    r = { "<cmd>Octo pr reload<cr>", "Reload PR" },
                    b = { "<cmd>Octo pr browser<cr>", "Open PR in Browser" },
                    R = { "<cmd>Octo pr ready<cr>", "Mark Draft PR as Ready for Review" },
                    x = { "<cmd>Octo pr close<cr>", "Close current PR" },
                    u = { "<cmd>Octo pr url<cr>", "Copy PR URL" },
                    v = { "<cmd>Octo pr checks<cr>", "Show PR Readiness Validation" },
                    n = { "<cmd>Octo pr create<cr>", "Create a PR from the current Branch" },
                },
                ["r"] = {
                    name = "+repo",
                    b = { "<cmd>Octo repo browser<cr>", "Open repo in browser" },
                    u = { "<cmd>Octo repo url<cr>", "Repo URL" },
                },
                ["t"] = {
                    name = "+threads",
                    r = { "<cmd>Octo thread resolve<cr>", "Resolve Thread" },
                    u = { "<cmd>Octo thread unresolve<cr>", "Unresolve Thread" },
                },
                ["R"] = {
                    name = "+review",
                    r = { "<cmd>Octo review start<cr>", "Start Review" },
                    s = { "<cmd>Octo review submit<cr>", "Submit Review" },
                    R = { "<cmd>Octo review resume<cr>", "Resume Review" },
                    D = { "<cmd>Octo review discard<cr>", "Discard Review" },
                    c = { "<cmd>Octo review comments<cr>", "View Review Comments" },
                    x = { "<cmd>Octo review close<cr>", "Close review window" },
                },
                s = { "<cmd>Octo search<cr>", "Search GH" },
                g = { "<cmd>Octo gist list<cr>", "List gists" },
                i = { "<cmd>Octo issue list<cr>", "List Issues in GitHub" },
                ["?"] = { "<cmd>Octo actions<cr>", "List Octo Actions" },
            },
            l = { "<cmd>lua lazygit_toggle()<cr>", "Open LazyGit" },
            y = { "<cmd>lua require('gitlinker').get_buf_range_url(n)<cr>", "Git Link to Line" },
            ["F"] = {
                name = "+find git",
                l = {
                    "<cmd>lua require'telescope'.extensions.advanced_git_search.search_log_content()<cr>",
                    "Search Log Content",
                },
                L = {
                    "<cmd>lua require'telescope'.extensions.advanced_git_search.diff_commit_line()<cr>",
                    "Search Diff Commit Line",
                },
                c = {
                    "<cmd>lua require'telescope'.extensions.advanced_git_search.diff_commit_file()<cr>",
                    "Search Diff Commit File",
                },
                b = {
                    "<cmd>lua require'telescope'.extensions.advanced_git_search.diff_commit_branch()<cr>",
                    "Search Diff Commit Branch",
                },
            },
        },
        -- ["n"] = {
        --     name = "+neorg",
        --     i = { "<cmd>Neorg workspace kb<cr>", "Neorg Knowledgebase Index" },
        --     I = { "<cmd>Neorg index<cr>", "Neorg Create a Index file in current Directory" },
        --     j = { "<cmd>Neorg journal<cr>", "Neorg Journal" },
        --     r = { "<cmd>Neorg return <cr>", "Neorg Return" },
        -- },
        ["o"] = {
            name = "+open",
            d = { "<Cmd>TodoTrouble<CR>", "Open TODO List (Trouble)" },
            D = { "<Cmd>TodoTelescope<CR>", "Open TODO List (Telescope)" },
            f = { ":normal gof<CR>", "Open File in Finder" },
            F = { ":normal goF<CR>", "Open PWD in Finder" },
            h = { ":silent !tmux split-window -dh", "Split Tmux Pane without Focus" },
            s = { ":silent !tmux split-window" .. " -c " .. "%:p:h" .. " <CR>:<C-[><CR>", "split tmux-window on cwd" },
            q = { "<Cmd>Trouble quickfix<CR>", "Open Quickfix" },
        },
        ["p"] = {
            name = "+project",
            f = { "<cmd>lua require('core.plugins.telescope').project_search()<cr>", "Open Project File" },
            p = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Project Finder" },
            z = { "<cmd>Telescope zoxide list<cr>", "Zoxide Directory List" },
        },
        ["s"] = {
            name = "+search",
            b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            f = { "<cmd>Telescope find_files<cr>", "Find file" },
            g = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            h = { "<cmd>Telescope command_history<cr>", "Find command history" },
            L = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
            m = { "<cmd>Telescope marks<cr>", "Marks" },
            n = { "<cmd>lua require('core.plugins.telescope').search_all_files()<cr>", "Search File Names in Context" },
            o = { "<cmd>Telescope oldfiles<cr>", "Open old files" },
            r = { "<cmd>Telescope resume<cr>", "Open previous search" },
            R = { "<cmd>Telescope registers<cr>", "Registers" },
            p = { "<cmd>TodoTelescope<cr>", "Open TODO comments" },
            P = { "<cmd>Telescope zoxide list<cr>", "Open projects" },
            t = { "<cmd>lua require('core.plugins.telescope').search_only_certain_files()<cr>", "Search by file types" },
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
        u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
        U = { "<cmd>:Telescope undo<cr>", "Telescope Undo" },
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
            l = { "<cmd>:Lazy<cr>", "Gogo Lazy" },
            m = { "<cmd>:Mason<cr>", "Gogo Mason" },
            n = { "<cmd>lua require('core.plugins.telescope').edit_nvim()<cr>", "Edit Nvim Config" },
            d = { "<cmd>lua require('core.plugins.telescope').edit_config()<cr>", "Edit Config Files" },
            s = {
                "<cmd>lua require('luasnip.loaders').edit_snippet_files()<cr>",
                "Edit current RT Snippets",
            },
            S = {
                "<cmd>source ~/Config/nvim/lua/core/plugins/luasnip/init.lua<cr>",
                "Hot reload for Snippets",
            },
        },
        ["w"] = {
            name = "+window",
            ["="] = { "<C-w>=", "Reset Window Layout" },
            ["-"] = { "<cmd>rightbelow sb<cr>", "Split Window Horizontal" },
            ["/"] = { "<cmd>vertical rightbelow sb<cr>", "Split Window Vertical" },
            d = { "<cmd>q<cr>", "Close Current Window" },
            D = { "<cmd>only<cr>", "Close All Other Windows" },
            h = { "<C-w>h", "Focus Window to Left" },
            l = { "<C-w>l", "Focus Window to Right" },
            j = { "<C-w>j", "Focus Window Below" },
            k = { "<C-w>k", "Focus Window Above" },
            H = { "<cmd>wincmd H<cr>", "Move Window to Right" },
            L = { "<cmd>wincmd L<cr>", "Move Window to Left" },
            J = { "<cmd>wincmd J<cr>", "Move Window to Bottom" },
            K = { "<cmd>wincmd K<cr>", "Move Window to Top" },
            s = { "<cmd>rightbelow sb<cr>", "Split Window Horizontal" },
            t = { "<cmd>enew<cr>", "New Empty Buffer" },
            T = {
                name = "tabs",
                d = { "<cmd>tabclose<cr>", "Close Current Tab" },
            },
            v = { "<cmd>vertical rightbelow sb<cr>", "Split Window Vertical" },
            f = {
                name = "file new window",
                l = {
                    "<cmd>vertical rightbelow sb<CR><Cmd>FzfLua files<cr>",
                    "New File Split Right",
                },
                h = { "<cmd>vertical sb<CR><Cmd>FzfLua files<cr>", "New File Split Left" },
                j = {
                    "<cmd>rightbelow sb<CR><Cmd>FzfLua files<cr>",
                    "New File Split Below",
                },
                k = { "<cmd>split<CR><Cmd>FzfLua files<cr>", "New File Split Above" },
            },
            N = {
                name = "new empty buffer",
                c = { "<cmd>enew<cr>", "New In Current Window" },
                h = { "<cmd>vnew<cr>", "New In Split Left" },
                l = { "<cmd>vertical rightbelow new<cr>", "New In Split Right" },
                j = { "<cmd>rightbelow new<cr>", "New In Split Below" },
                k = { "<cmd>new<cr>", "New In Split Above" },
            },
        },
        ["x"] = {
            name = "+tooling",
            x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
            t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
            T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
            l = { "<cmd>lopen<cr>", "Open Location List" },
            q = { "<cmd>copen<cr>", "Open Quickfix List" },
        },
        ["`"] = { "<cmd>ToggleTerm dir=%:p:h<cr>", "Terminal" },
        ["z"] = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
    },
})
