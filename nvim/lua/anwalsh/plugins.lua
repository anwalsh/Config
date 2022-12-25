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
    ("wbthomason/packer.nvim"),

    -- UI
    ("Mofiqul/dracula.nvim"),
    ("nyoom-engineering/oxocarbon.nvim"),
    ("nvim-lualine/lualine.nvim"),
    ("nvim-lua/popup.nvim"),
    ("beauwilliams/focus.nvim"),
    ("kyazdani42/nvim-web-devicons"),
    ("stevearc/aerial.nvim"),
    ("luukvbaal/stabilize.nvim"),
    -- ({
    --     "stevearc/stickybuf.nvim",
    --     config = function()
    --         require("stickybuf").setup()
    --     end,
    -- }),
    ("nvim-telescope/telescope-file-browser.nvim"),
    {
        "nvim-tree/nvim-tree.lua",
        version = "nightly" -- optional, updated every week. (see issue #1193)
    },

    -- Text Rendering
    ("lukas-reineke/indent-blankline.nvim"),

    -- Navigation
    ({"folke/which-key.nvim"}),
    ("phaazon/hop.nvim"),

    -- Comments
    ("numToStr/Comment.nvim"),
    ({
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    }),

    -- Utility
    ("lewis6991/impatient.nvim"),
    ("nvim-lua/plenary.nvim"),
    ("mbbill/undotree"),
    ("kazhala/close-buffers.nvim"),
    ({
        "chrisbra/NrrwRgn",
        cmd = { "NarrowRegion", "NarrowWindow" },
    }),
    ("norcalli/nvim-colorizer.lua"),
    ("akinsho/toggleterm.nvim"),
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
    ({"eraserhd/parinfer-rust", build = "cargo build --release"}),

    -- Prose
    ("preservim/vim-pencil"),
    ("nacro90/numb.nvim"),

    -- Telescope
    ({ "nvim-telescope/telescope.nvim", dependencies = { { "nvim-lua/plenary.nvim" }, "nvim-lua/popup.nvim" } }),
    ("nvim-telescope/telescope-github.nvim"),
    ("nvim-telescope/telescope-project.nvim"),
    ("crispgm/telescope-heading.nvim"),
    ("dhruvmanila/telescope-bookmarks.nvim"),
    ("jvgrootveld/telescope-zoxide"),

    -- Language/Treesitter
    ({ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }),
    ({ "nvim-treesitter/playground", build = ":TSInstall query" }),
    ({ "SmiteshP/nvim-gps" }),
    ("nvim-treesitter/nvim-treesitter-context"),
    ("jose-elias-alvarez/null-ls.nvim"),
    ("folke/lsp-trouble.nvim"),
    ("simrat39/rust-tools.nvim"),
    ("folke/neodev.nvim"),
    ({"elzr/vim-json", ft = "json"}),

    -- Debug Adapater
    ("mfussenegger/nvim-dap"),
    ("rcarriga/nvim-dap-ui"),
    ("leoluz/nvim-dap-go"),
    ("theHamsta/nvim-dap-virtual-text"),
    ("nvim-telescope/telescope-dap.nvim"),

    -- Doc Strings
    ("danymat/neogen"),

    -- Completion/LSP
    ("neovim/nvim-lspconfig"),
    ({"hrsh7th/nvim-cmp", dependencies = "onsails/lspkind.nvim" }),
    ("hrsh7th/vim-vsnip"),
    ("L3MON4D3/LuaSnip"),
    ("rafamadriz/friendly-snippets"),
    ("saadparwaiz1/cmp_luasnip"),
    ("lukas-reineke/cmp-under-comparator"),
    ("hrsh7th/cmp-nvim-lsp"),
    ("hrsh7th/cmp-vsnip"),
    ("hrsh7th/cmp-path"),
    ("hrsh7th/cmp-buffer"),
    ("hrsh7th/cmp-nvim-lua"),
    ("hrsh7th/cmp-nvim-lsp-document-symbol"),
    ("hrsh7th/cmp-nvim-lsp-signature-help"),
    ("hrsh7th/cmp-emoji"),
    ("octaltree/cmp-look"), -- TODO: Figure out how to only get this to run in txt/markdown/whatever, and then only in comments as well.
    ("ray-x/cmp-treesitter"),
    ("folke/lsp-colors.nvim"),
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

    -- Search
    ({ "junegunn/fzf", build = "./install --all" }),

    -- Markdown and Writing
    -- ("SidOfc/mkdx"),
    ({"jakewvincent/mkdnflow.nvim"}),

    -- Git integration
    ("lewis6991/gitsigns.nvim"),
    ("pwntester/octo.nvim"),
    ({ "ruifm/gitlinker.nvim", dependencies = "nvim-lua/plenary.nvim" }),
    ({ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" }),
    ({"rhysd/git-messenger.vim"}),
    ({ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" }),
    ({ "akinsho/git-conflict.nvim" }),
}
