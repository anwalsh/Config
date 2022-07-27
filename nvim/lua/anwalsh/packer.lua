-- Bootstrap the Packer as required.
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

require("packer").init({ max_jobs = 50 })

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("Mofiqul/dracula.nvim")
    use("nvim-lualine/lualine.nvim")
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" }, "nvim-lua/popup.nvim" } })
    use("nvim-telescope/telescope-github.nvim")
    use("nvim-telescope/telescope-project.nvim")
    use("crispgm/telescope-heading.nvim")
    use("dhruvmanila/telescope-bookmarks.nvim")

    -- Language/Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground", run = ":TSInstall query" })
    use({ "SmiteshP/nvim-gps", requires = "nvim-tree-sitter/nvim-treesitter" })
    use({ "kkoomen/vim-doge", run = ":call doge#install()" })
    use("preservim/vim-lexical")
    use("preservim/vim-pencil")
    use("stevearc/aerial.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Completion/LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp-document-symbol")
    use("hrsh7th/cmp-emoji")
    use("octaltree/cmp-look") -- TODO: Figure out how to only get this to run in txt/markdown/whatever, and then only in comments as well.
    use("ray-x/cmp-treesitter")
    use("williamboman/nvim-lsp-installer")
    -- use("williamboman/mason-lspconfig.nvim") --TODO Does this work? How does it work?
    -- use("williamboman/mason.nvim")
    -- use("WhoIsSethDaniel/mason-tool-installer.nvim")
    use("folke/lsp-colors.nvim")
    use("folke/lua-dev.nvim")
    use("ray-x/lsp_signature.nvim")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("windwp/nvim-autopairs")
    use("onsails/lspkind-nvim")
    use({
        "ray-x/navigator.lua",
        requires = {
            { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
            { "neovim/nvim-lspconfig" },
        },
    })
    use({
        "ericpubu/lsp_codelens_extensions.nvim",
        config = function()
            require("codelens_extensions").setup()
        end,
    })
    use({
        "folke/lsp-trouble.nvim",
        cmd = "Trouble",
        config = function()
            -- Can use P to toggle auto movement
            require("trouble").setup({
                auto_preview = false,
                auto_fold = true,
            })
        end,
    })

    use("ray-x/guihua.lua")
    use("lukas-reineke/indent-blankline.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("AckslD/nvim-neoclip.lua")
    use("ellisonleao/glow.nvim")
    use("mbbill/undotree")
    use("ThePrimeagen/git-worktree.nvim")
    use("numToStr/Comment.nvim")
    use("lewis6991/gitsigns.nvim")
    use({ "junegunn/fzf", run = "./install --all" })
    use("junegunn/fzf.vim")
    use("junegunn/vim-easy-align")
    use("sindrets/diffview.nvim")
    use("ervandew/supertab")
    use({
        "chrisbra/NrrwRgn",
        cmd = { "NarrowRegion", "NarrowWindow" },
    })
    use({
        "mhinz/vim-startify",
        cmd = { "SLoad", "SSave" },
        config = function()
            vim.g.startify_disable_at_vimenter = true
        end,
    })
    use("norcalli/nvim-colorizer.lua")
    use({
        "norcalli/nvim-terminal.lua",
        config = function()
            require("terminal").setup()
        end,
    })
    use({
        "tpope/vim-scriptease",
        cmd = {
            "Messages", --view messages in quickfix list
        },
    })
    use("romainl/vim-qf")
    use("sjl/gundo.vim")
    use({ "elzr/vim-json", ft = "json" })
    use("Glench/Vim-Jinja2-Syntax")
    use("justinmk/vim-syntax-extra")
    use({
        "prettier/vim-prettier",
        ft = { "html", "javascript", "typescript", "typescriptreact" },
        run = "yarn install",
    })
    use("saadparwaiz1/cmp_luasnip")
    use("tamago324/cmp-zsh")
    use("lukas-reineke/cmp-under-comparator")
    use("google/vim-searchindex")
    use("tamago324/lir.nvim")
    use("tamago324/lir-git-status.nvim")
    use("pechorin/any-jump.vim")
    use("nacro90/numb.nvim")
    use("luukvbaal/stabilize.nvim")
    use("kdheepak/tabline.nvim")
    use("qpkorr/vim-bufkill")
    -- TEXT MANIUPLATION
    use("andymass/vim-matchup")
    use("godlygeek/tabular") -- Quickly align text by pattern
    use("inkarkat/vim-LineJuggler")
    use("nvim-pack/nvim-spectre")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat") -- Repeat actions better
    use("tpope/vim-abolish")
    use("tpope/vim-characterize")
    use({ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } })
    use("tpope/vim-surround")
    use({
        "AndrewRadev/splitjoin.vim",
        keys = { "gJ", "gS" },
    })
    use "machakann/vim-sandwich"

    -- Github integration
    if vim.fn.executable("gh") == 1 then
        use("pwntester/octo.nvim")
    end
    use({ "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
    use({
        "rhysd/git-messenger.vim",
        keys = "<Plug>(git-messenger)",
    })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
