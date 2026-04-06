-------------------------------------------------------------------------------
-- Plugin Management via vim.pack (Neovim 0.12)
--
-- All plugin sources are declared here. Configuration for each plugin
-- lives in lua/aw/plugins/*.lua and is loaded from init.lua.
-------------------------------------------------------------------------------
local gh = function(x) return "https://github.com/" .. x end

-- Build hooks for plugins that need post-install steps
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= "install" and kind ~= "update" then return end

        if name == "telescope-fzf-native.nvim" then
            vim.system({ "make" }, { cwd = ev.data.path }):wait()
        end
        if name == "nvim-treesitter" then
            vim.cmd("TSUpdate")
        end
        if name == "LuaSnip" then
            vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
        end
        if name == "fzf" then
            vim.system({ "./install", "--all" }, { cwd = ev.data.path }):wait()
        end
    end,
})

vim.pack.add({
    ---------------------------------------------------------------------------
    -- Theme
    ---------------------------------------------------------------------------
    gh("EdenEast/nightfox.nvim"),
    gh("catppuccin/nvim"),
    gh("rebelot/kanagawa.nvim"),
    gh("folke/tokyonight.nvim"),
    gh("projekt0n/github-nvim-theme"),
    { src = gh("rose-pine/neovim"), name = "rose-pine" },

    ---------------------------------------------------------------------------
    -- Core dependencies
    ---------------------------------------------------------------------------
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("MunifTanjim/nui.nvim"),
    gh("nvim-neotest/nvim-nio"),
    gh("kkharji/sqlite.lua"),
    gh("b0o/SchemaStore.nvim"),

    ---------------------------------------------------------------------------
    -- LSP
    ---------------------------------------------------------------------------
    gh("neovim/nvim-lspconfig"),
    gh("williamboman/mason.nvim"),
    gh("onsails/lspkind-nvim"),
    gh("SmiteshP/nvim-navic"),

    ---------------------------------------------------------------------------
    -- Completion (blink.cmp replaces nvim-cmp)
    ---------------------------------------------------------------------------
    { src = gh("saghen/blink.cmp"), version = vim.version.range("1.0") },

    ---------------------------------------------------------------------------
    -- Snippets
    ---------------------------------------------------------------------------
    gh("L3MON4D3/LuaSnip"),
    gh("rafamadriz/friendly-snippets"),

    ---------------------------------------------------------------------------
    -- Treesitter
    ---------------------------------------------------------------------------
    gh("nvim-treesitter/nvim-treesitter"),

    ---------------------------------------------------------------------------
    -- Telescope + extensions
    ---------------------------------------------------------------------------
    gh("nvim-telescope/telescope.nvim"),
    gh("nvim-telescope/telescope-fzf-native.nvim"),
    gh("nvim-telescope/telescope-symbols.nvim"),
    gh("nvim-telescope/telescope-file-browser.nvim"),
    gh("nvim-telescope/telescope-github.nvim"),
    gh("nvim-telescope/telescope-project.nvim"),
    gh("nvim-telescope/telescope-dap.nvim"),
    gh("tom-anders/telescope-vim-bookmarks.nvim"),
    gh("crispgm/telescope-heading.nvim"),
    gh("dhruvmanila/telescope-bookmarks.nvim"),
    gh("jvgrootveld/telescope-zoxide"),
    gh("debugloop/telescope-undo.nvim"),
    gh("benfowler/telescope-luasnip.nvim"),
    gh("aaronhallaert/advanced-git-search.nvim"),

    ---------------------------------------------------------------------------
    -- Git
    ---------------------------------------------------------------------------
    gh("lewis6991/gitsigns.nvim"),
    gh("NeogitOrg/neogit"),
    gh("sindrets/diffview.nvim"),
    gh("akinsho/git-conflict.nvim"),
    gh("ruifm/gitlinker.nvim"),
    gh("tpope/vim-fugitive"),
    gh("tpope/vim-rhubarb"),
    gh("ThePrimeagen/git-worktree.nvim"),
    gh("pwntester/octo.nvim"),

    ---------------------------------------------------------------------------
    -- UI
    ---------------------------------------------------------------------------
    gh("nvim-lualine/lualine.nvim"),
    gh("folke/noice.nvim"),
    gh("rcarriga/nvim-notify"),
    gh("j-hui/fidget.nvim"),
    gh("stevearc/dressing.nvim"),
    gh("lukas-reineke/indent-blankline.nvim"),
    gh("echasnovski/mini.nvim"),
    gh("NvChad/nvim-colorizer.lua"),

    ---------------------------------------------------------------------------
    -- Navigation / Search
    ---------------------------------------------------------------------------
    gh("folke/flash.nvim"),
    gh("ThePrimeagen/harpoon"),
    gh("stevearc/oil.nvim"),
    gh("nvim-neo-tree/neo-tree.nvim"),
    gh("nacro90/numb.nvim"),

    ---------------------------------------------------------------------------
    -- Editor / Text manipulation
    ---------------------------------------------------------------------------
    gh("numToStr/Comment.nvim"),
    gh("windwp/nvim-autopairs"),
    gh("kylechui/nvim-surround"),
    gh("tpope/vim-abolish"),
    gh("tpope/vim-repeat"),
    gh("Wansmer/treesj"),
    gh("gbprod/yanky.nvim"),
    gh("cappyzawa/trim.nvim"),
    gh("smjonas/inc-rename.nvim"),
    gh("danymat/neogen"),

    ---------------------------------------------------------------------------
    -- Format + Lint
    ---------------------------------------------------------------------------
    gh("stevearc/conform.nvim"),
    gh("mfussenegger/nvim-lint"),

    ---------------------------------------------------------------------------
    -- DAP (Debug Adapter Protocol)
    ---------------------------------------------------------------------------
    gh("mfussenegger/nvim-dap"),
    gh("rcarriga/nvim-dap-ui"),
    gh("theHamsta/nvim-dap-virtual-text"),
    gh("jay-babu/mason-nvim-dap.nvim"),

    ---------------------------------------------------------------------------
    -- Testing
    ---------------------------------------------------------------------------
    gh("nvim-neotest/neotest"),
    gh("nvim-neotest/neotest-plenary"),
    gh("nvim-neotest/neotest-go"),
    gh("rouge8/neotest-rust"),

    ---------------------------------------------------------------------------
    -- Language-specific
    ---------------------------------------------------------------------------
    gh("mrcjkb/rustaceanvim"),
    gh("saecki/crates.nvim"),
    gh("olexsmir/gopher.nvim"),
    gh("linux-cultist/venv-selector.nvim"),
    gh("jakewvincent/mkdnflow.nvim"),

    ---------------------------------------------------------------------------
    -- Which-key
    ---------------------------------------------------------------------------
    gh("folke/which-key.nvim"),
    gh("mrjones2014/legendary.nvim"),

    ---------------------------------------------------------------------------
    -- Misc
    ---------------------------------------------------------------------------
    gh("folke/trouble.nvim"),
    gh("folke/todo-comments.nvim"),
    gh("stevearc/aerial.nvim"),
    gh("kevinhwang91/nvim-bqf"),
    gh("junegunn/fzf"),
    gh("stevearc/qf_helper.nvim"),
    gh("akinsho/toggleterm.nvim"),
    gh("mbbill/undotree"),
    gh("folke/zen-mode.nvim"),
    gh("nvim-focus/focus.nvim"),
    gh("willothy/flatten.nvim"),
    gh("tpope/vim-dispatch"),
    gh("MTDL9/vim-log-highlighting"),
    gh("nvim-pack/nvim-spectre"),
    gh("MattesGroeger/vim-bookmarks"),
    gh("cshuaimin/ssr.nvim"),
    gh("AckslD/muren.nvim"),
    gh("norcalli/nvim-terminal.lua"),
})
