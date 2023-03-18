local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

return {
    -- UI

    -- Themes
    ({ "Mofiqul/dracula.nvim" }),
    ({ "nyoom-engineering/oxocarbon.nvim" }),
    ({ "EdenEast/nightfox.nvim" }),
    ({ "catppuccin/nvim", as = "catppuccin" }),
    ({ "projekt0n/github-nvim-theme" }),
    ({ "folke/tokyonight.nvim" }),
    ({ "rebelot/kanagawa.nvim" }),

    -- Supporting Libs
    ({ "folke/noice.nvim", dependencies = "MunifTanjim/nui.nvim", lazy = false }),
    ({ "stevearc/dressing.nvim", lazy = false }), -- UI library, used in other plugins
    -- Elements
    ("kyazdani42/nvim-web-devicons"),
    -- UI Tweaks
    ({ "nvim-lualine/lualine.nvim", lazy = false }),
    ("nvim-lua/popup.nvim"),
    -- ({ "levouh/tint.nvim", lazy = false }), -- TODO: Figure out the highlight issue with text fields
    -- Notifications
    -- Behaviors of Buffers/Frames
    ("beauwilliams/focus.nvim"),
    ("stevearc/aerial.nvim"),
    ("luukvbaal/stabilize.nvim"),
    ({ "folke/zen-mode.nvim", dependencies = "folke/twilight.nvim", lazy = false }),
    --
    -- ({
    --     "stevearc/stickybuf.nvim",
    --     config = function()
    --         require("stickybuf").setup()
    --     end,
    -- }),

    -- Forest
    ({
        "nvim-tree/nvim-tree.lua",
        version = "nightly", -- optional, updated every week. (see issue #1193)
        lazy = false
    }),
    ({ "mbbill/undotree", lazy = false }),

    -- Text Rendering
    ({ "lukas-reineke/indent-blankline.nvim", lazy = false }),

    -- Color Rendering
    ({ "norcalli/nvim-colorizer.lua", dependencies = "norcalli/nvim-terminal.lua" }),

    -- Navigation
    ({ "ggandor/leap.nvim", lazy = false }),
    ({ "ggandor/flit.nvim", lazy = false }),
    ({ "folke/which-key.nvim", lazy = false }),
    ({ "mrjones2014/legendary.nvim", version = "^2.1.0", config = true, lazy = false }),

    -- Comments
    ({ "numToStr/Comment.nvim", lazy = false }),
    ({
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    }),

    -- Utility
    ("lewis6991/impatient.nvim"),
    ("nvim-lua/plenary.nvim"),
    ({ "kazhala/close-buffers.nvim", lazy = false }),
    ({
        "chrisbra/NrrwRgn",
        cmd = { "NarrowRegion", "NarrowWindow" },
    }),

    -- Tools
    ("tpope/vim-scriptease"),
    ("romainl/vim-qf"), -- QuickFix Window helper
    ("andymass/vim-matchup"),
    ({ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } }),
    ("williamboman/mason.nvim"),
    ("williamboman/mason-lspconfig.nvim"),
    ({
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline" },
        config = function()
            require("symbols-outline").setup()
        end,
    }),
    ({
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = function()
            require("inc_rename").setup()
        end,
    }),
    ({ "ThePrimeagen/harpoon" }),
    ({ "akinsho/toggleterm.nvim", lazy = false }),
    ({ "willothy/flatten.nvim", lazy = false }),

    -- Text Manipulation
    ("junegunn/vim-easy-align"),
    ("nvim-pack/nvim-spectre"),
    ("tpope/vim-repeat"),
    ("tpope/vim-abolish"),
    ("tpope/vim-characterize"),
    ("tpope/vim-surround"),
    ({
        "AndrewRadev/splitjoin.vim",
        keys =
        {
            { "gJ", desc = "Join a block into single line." },
            { "gS", desc = "Split one line into multi-line." },
        }
    }),
    ("machakann/vim-sandwich"),

    -- Formatting
    ("windwp/nvim-autopairs"),
    ({ "eraserhd/parinfer-rust", build = "cargo build --release" }),

    -- Prose
    ("preservim/vim-pencil"),
    ("nacro90/numb.nvim"),

    -- Telescope
    ({ "nvim-telescope/telescope.nvim", dependencies = { { "nvim-lua/plenary.nvim" }, "nvim-lua/popup.nvim" } }),
    ("nvim-telescope/telescope-file-browser.nvim"),
    ("nvim-telescope/telescope-github.nvim"),
    ("nvim-telescope/telescope-project.nvim"),
    ("crispgm/telescope-heading.nvim"),
    ("dhruvmanila/telescope-bookmarks.nvim"),
    ("jvgrootveld/telescope-zoxide"),
    ({ "aaronhallaert/advanced-git-search.nvim" }),

    -- Language/Treesitter
    ({ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }),
    ({ "nvim-treesitter/playground", build = ":TSInstall query" }),
    ({ "SmiteshP/nvim-gps", lazy = false }),
    ("nvim-treesitter/nvim-treesitter-context"),
    ("jose-elias-alvarez/null-ls.nvim"),
    ("folke/lsp-trouble.nvim"),
    ("simrat39/rust-tools.nvim"),
    ("folke/neodev.nvim"),

    -- Debug Adapater
    ("mfussenegger/nvim-dap"),
    ("rcarriga/nvim-dap-ui"),
    ("theHamsta/nvim-dap-virtual-text"),
    ("nvim-telescope/telescope-dap.nvim"),
    -- ("puremourning/vimspector"),
    -- Debug Languages
    ("leoluz/nvim-dap-go"),
    ("mfussenegger/nvim-dap-python"),

    -- Languages

    -- Doc Strings
    ("danymat/neogen"),

    -- Completion/LSP
    { "onsails/lspkind-nvim" }, -- adds icons to autocomplete menu
    ("neovim/nvim-lspconfig"),
    ({ "hrsh7th/nvim-cmp", dependencies = "onsails/lspkind.nvim" }),
    ({ "L3MON4D3/LuaSnip", build = "make install_jsregexp", lazy = false }),
    ("rafamadriz/friendly-snippets"),
    ({ "saadparwaiz1/cmp_luasnip", lazy = false }),
    ("lukas-reineke/cmp-under-comparator"),
    ("hrsh7th/cmp-nvim-lsp"),
    ("hrsh7th/cmp-path"),
    ("hrsh7th/cmp-buffer"),
    ("hrsh7th/cmp-nvim-lua"),
    ("hrsh7th/cmp-nvim-lsp-document-symbol"),
    ("hrsh7th/cmp-nvim-lsp-signature-help"),
    ("hrsh7th/cmp-emoji"),
    ({ "jayp0521/mason-null-ls.nvim" }), -- bridge for mason to null-ls
    ("octaltree/cmp-look"),
    ("ray-x/cmp-treesitter"),
    ("folke/lsp-colors.nvim"),
    ("j-hui/fidget.nvim"),
    -- ("ray-x/lsp_signature.nvim"), -- TODO: Should I use this?
    -- ("ray-x/guihua.lua"), -- TODO: Same question for the below possibles.
    -- ({
    --     "ray-x/navigator.lua",
    --     dependencies = {
    --         { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    --         { "neovim/nvim-lspconfig" },
    --     },
    -- }),
    ({ "MTDL9/vim-log-highlighting" }),
    ("narutoxy/dim.lua"), -- May not work in all contexts (specifically works in Rust)
    ({ "SmiteshP/nvim-navic", lazy = false }),

    -- Search
    ({ "junegunn/fzf", build = "./install --all" }),
    ({ "yamatsum/nvim-cursorline", lazy = false }),

    -- Markdown and Writing
    ({ "SidOfc/mkdx" }),
    ({ "jakewvincent/mkdnflow.nvim" }),

    -- Git integration
    ({ "tpope/vim-fugitive", lazy = false }),
    ("lewis6991/gitsigns.nvim"),
    (
        { "pwntester/octo.nvim",
            dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons" },
            lazy = false }),
    ({ "ruifm/gitlinker.nvim", dependencies = "nvim-lua/plenary.nvim" }),
    ({ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim", lazy = false }),
    ({ "rhysd/git-messenger.vim" }),
    ({ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim", lazy = false }),
    ({ "akinsho/git-conflict.nvim" }),
    ({ "ThePrimeagen/git-worktree.nvim" }),
}
