-- Bootstrap the Packer as required.packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").init({ max_jobs = 50 })

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- UI
    use("Mofiqul/dracula.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-lua/popup.nvim")
    use("noib3/nvim-cokeline")
    -- use({"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"})
    use("beauwilliams/focus.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("stevearc/aerial.nvim")
    use("luukvbaal/stabilize.nvim")
    -- use({
    --     "stevearc/stickybuf.nvim",
    --     config = function()
    --         require("stickybuf").setup()
    --     end,
    -- })
    use("onsails/lspkind-nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Text Rendering
    use("lukas-reineke/indent-blankline.nvim")

    -- Navigation
    use({"folke/which-key.nvim"})
    use("phaazon/hop.nvim")

    -- Comments
    use("numToStr/Comment.nvim")
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        })

    -- Utility
    use("nvim-lua/plenary.nvim")
    use("mbbill/undotree")
    use("kazhala/close-buffers.nvim")
    use({
        "chrisbra/NrrwRgn",
        cmd = { "NarrowRegion", "NarrowWindow" },
    })
    use("norcalli/nvim-colorizer.lua")
    use("akinsho/toggleterm.nvim")
    use("tpope/vim-scriptease")
    use("romainl/vim-qf") -- QuickFix Window helper
    use("andymass/vim-matchup")
    use({ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } })
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use({
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline" },
        config = function()
            require("symbols-outline").setup()
        end,
    })

    -- Text Manipulation
    use("junegunn/vim-easy-align")
    use("nvim-pack/nvim-spectre")
    use("tpope/vim-repeat")
    use("tpope/vim-abolish")
    use("tpope/vim-characterize")
    use("tpope/vim-surround")
    use({
        "AndrewRadev/splitjoin.vim",
        keys = { "gJ", "gS" },
    })
    use("machakann/vim-sandwich")

  -- Formatting
    use("windwp/nvim-autopairs")
    use("eraserhd/parinfer-rust")
    use({
        "prettier/vim-prettier",
        ft = { "html", "javascript", "typescript", "typescriptreact" },
        run = "yarn install",
    })

    -- Prose
    use("preservim/vim-pencil")
    use("nacro90/numb.nvim")

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" }, "nvim-lua/popup.nvim" } })
    use("nvim-telescope/telescope-github.nvim")
    use("nvim-telescope/telescope-project.nvim")
    use("crispgm/telescope-heading.nvim")
    use("dhruvmanila/telescope-bookmarks.nvim")
    use("jvgrootveld/telescope-zoxide")

    -- Language/Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground", run = ":TSInstall query" })
    use({ "SmiteshP/nvim-gps", requires = "nvim-tree-sitter/nvim-treesitter" })
    use("nvim-treesitter/nvim-treesitter-context")
    -- use("jose-elias-alvarez/null-ls.nvim")
    use({"folke/lsp-trouble.nvim"})
    use({"simrat39/rust-tools.nvim"})
    use("folke/lua-dev.nvim")
    use({"elzr/vim-json", ft = "json"})

    -- Debug Adapater
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")

    -- Doc Strings
    use("danymat/neogen")

    -- Completion/LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")
    use("lukas-reineke/cmp-under-comparator")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-document-symbol")
    use("hrsh7th/cmp-emoji")
    use("octaltree/cmp-look") -- TODO: Figure out how to only get this to run in txt/markdown/whatever, and then only in comments as well.
    use("ray-x/cmp-treesitter")
    use("folke/lsp-colors.nvim")
    -- use("ray-x/lsp_signature.nvim") -- TODO: Should I use this?
    -- use("ray-x/guihua.lua") -- TODO: Same question for the below possibles.
    -- use({
    --     "ray-x/navigator.lua",
    --     requires = {
    --         { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    --         { "neovim/nvim-lspconfig" },
    --     },
    -- })
    use({ "MTDL9/vim-log-highlighting" })

    -- Search
    use({ "junegunn/fzf", run = "./install --all" })
    use("junegunn/fzf.vim")

    -- Markdown and Writing
    -- use("SidOfc/mkdx")
    use({'jakewvincent/mkdnflow.nvim',
     config = function()
        require('mkdnflow').setup({
            -- Config goes here; leave blank for defaults
        })
     end
})

    -- Git integration
    use("lewis6991/gitsigns.nvim")
    if vim.fn.executable("gh") == 1 then
        use("pwntester/octo.nvim")
    end
    use({ "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
    use({
        "rhysd/git-messenger.vim",
        keys = "<Plug>(git-messenger)",
    })
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "akinsho/git-conflict.nvim" })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
