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
    -- Themes ============================= {{{
    { "Mofiqul/dracula.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "catppuccin/nvim",                 as = "catppuccin" },
    { "folke/tokyonight.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "nyoom-engineering/oxocarbon.nvim" },
    -- }}}

    -- UI ============================= {{{
    { "folke/noice.nvim",                dependencies = "MunifTanjim/nui.nvim", lazy = false },
    { "stevearc/dressing.nvim",          lazy = false }, -- UI library, used in other plugins
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-lualine/lualine.nvim",       lazy = false },
    { "nvim-lua/popup.nvim" },
    { "stevearc/aerial.nvim" },
    { "onsails/lspkind-nvim" }, -- adds icons to autocomplete menu
    -- }}}

    -- Window and Buffer Manipulation ============================= {{{
    { "beauwilliams/focus.nvim" },
    { "luukvbaal/stabilize.nvim",        lazy = false },
    { "folke/zen-mode.nvim",             dependencies = "folke/twilight.nvim",  lazy = false },
    { "kazhala/close-buffers.nvim",      lazy = false },
    {
        "chrisbra/NrrwRgn",
        cmd = { "NarrowRegion", "NarrowWindow" },
    },
    { "romainl/vim-qf" }, -- QuickFix Window helper
    { "willothy/flatten.nvim",               lazy = false },
    -- }}}

    -- Tooling ============================= {{{
    { "nvim-neo-tree/neo-tree.nvim",         lazy = false },
    { "mbbill/undotree",                     lazy = false },
    { "lukas-reineke/indent-blankline.nvim", lazy = false },
    { "norcalli/nvim-colorizer.lua",         dependencies = "norcalli/nvim-terminal.lua" },
    { "ggandor/leap.nvim",                   lazy = false },
    { "ggandor/flit.nvim",                   lazy = false },
    { "folke/which-key.nvim",                lazy = false },
    -- { "levouh/tint.nvim",                    lazy = false }, -- TODO: Some oddities here with text fields and rendering that I haven't sorted
    {
        "mrjones2014/legendary.nvim",
        version = "^2.1.0",
        config = true,
        lazy = false,
    },
    { "numToStr/Comment.nvim",   lazy = false },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tpope/vim-scriptease" },
    {
        "MattesGroeger/vim-bookmarks",
        lazy = false,
    },
    { "andymass/vim-matchup" },
    { "tpope/vim-dispatch",  cmd = { "Dispatch", "Make" } },
    { "SmiteshP/nvim-gps",   lazy = false },
    -- }}}

    -- Languages ============================= {{{
    {
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline" },
        config = function() require("symbols-outline").setup() end,
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = function() require("inc_rename").setup() end,
    },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "folke/lsp-trouble.nvim" },
    { "simrat39/rust-tools.nvim" },
    { "folke/neodev.nvim" },
    { "danymat/neogen" },
    { "linux-cultist/venv-selector.nvim" },
    { "rktjmp/hotpot.nvim",              lazy = false },
    { "folke/lsp-colors.nvim" },
    -- }}}

    -- Debuggers ============================= {{{
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "leoluz/nvim-dap-go" },
    { "mfussenegger/nvim-dap-python" },
    -- }}}

    -- Completions ============================= {{{
    { "tamago324/cmp-zsh" },
    { "mtoohey31/cmp-fish", ft = "fish" },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets", module = false, event = "InsertEnter" }, -- , event = "InsertEnter"
        module = true,
        config = function() require("anwalsh.completions.luasnip.luasnip") end,
        build = "make install_jsregexp",
        lazy = false,
    },
    { "rafamadriz/friendly-snippets" },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = "L3MON4D3/LuaSnip",
        lazy = false,
    },
    { "lukas-reineke/cmp-under-comparator" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-emoji" },
    { "octaltree/cmp-look" },
    -- }}}

    -- Treesitter ============================= {{{
    { "nvim-treesitter/nvim-treesitter",        build = ":TSUpdate" },
    { "nvim-treesitter/playground",             build = ":TSInstall query" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "ray-x/cmp-treesitter" },
    -- }}}

    -- Telescope ============================= {{{
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" }, "nvim-lua/popup.nvim" },
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "tom-anders/telescope-vim-bookmarks.nvim" },
    { "nvim-telescope/telescope-github.nvim" },
    { "nvim-telescope/telescope-project.nvim" },
    { "crispgm/telescope-heading.nvim" },
    { "dhruvmanila/telescope-bookmarks.nvim" },
    { "jvgrootveld/telescope-zoxide" },
    { "nvim-telescope/telescope-dap.nvim" },
    -- }}}

    -- Neovim Utility ============================= {{{
    { "j-hui/fidget.nvim" },
    { "MTDL9/vim-log-highlighting" },
    { "narutoxy/dim.lua" }, -- May not work in all contexts (specifically works in Rust)
    { "SmiteshP/nvim-navic",                       lazy = false },
    { "yamatsum/nvim-cursorline",                  lazy = false },
    { "junegunn/fzf",                              build = "./install --all" },
    -- }}}

    -- Text Manipulation ============================= {{{
    { "junegunn/vim-easy-align" },
    { "nvim-pack/nvim-spectre" },
    { "tpope/vim-repeat" },
    { "tpope/vim-abolish" },
    { "tpope/vim-characterize" },
    { "tpope/vim-surround" },
    {
        "AndrewRadev/splitjoin.vim",
        keys = {
            { "gJ", desc = "Join a block into single line." },
            { "gS", desc = "Split one line into multi-line." },
        },
    },
    { "machakann/vim-sandwich" },
    { "windwp/nvim-autopairs" },
    { "eraserhd/parinfer-rust",                build = "cargo build --release" },
    { "preservim/vim-pencil" },
    { "nacro90/numb.nvim" },
    -- }}}

    -- Git ============================= {{{
    { "aaronhallaert/advanced-git-search.nvim" },
    { "tpope/vim-fugitive",                    lazy = false },
    { "lewis6991/gitsigns.nvim" },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        lazy = false,
    },
    { "ruifm/gitlinker.nvim",             dependencies = "nvim-lua/plenary.nvim" },
    { "TimUntersberger/neogit",           dependencies = "nvim-lua/plenary.nvim", lazy = false },
    { "rhysd/git-messenger.vim" },
    { "sindrets/diffview.nvim",           dependencies = "nvim-lua/plenary.nvim", lazy = false },
    { "akinsho/git-conflict.nvim" },
    -- }}}

    -- Package Management ============================= {{{
    { "williamboman/mason.nvim",          build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },
    { "jayp0521/mason-null-ls.nvim" }, -- bridge for mason to null-ls
    { "neovim/nvim-lspconfig" },
    -- }}}

    -- Project Management ============================= {{{
    { "ThePrimeagen/harpoon" },
    { "ThePrimeagen/git-worktree.nvim" },
    -- }}}

    -- Terminal ============================= {{{
    { "akinsho/toggleterm.nvim",          lazy = false },
    -- }}}

    -- Markdown/Latex ============================= {{{
    { "SidOfc/mkdx" },
    { "jakewvincent/mkdnflow.nvim" },
    -- }}}

    -- Knowledge Base and Markdown related Plugins ============================= {{{
    { "nvim-neorg/neorg",                 build = ":Neorg sync-parsers",          lazy = false },
    { "jakewvincent/mkdnflow.nvim",       dependencies = "starwing/luautf8" },
    -- }}}
}
