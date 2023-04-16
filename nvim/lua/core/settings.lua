local M = {}
-- theme: nightfox, carbonfox, oxocarbon, kanagawa, catppuccin; default is carbonfox
-- refer to the themes settings file for different styles
M.theme = "carbonfox"
-- use rg instead of grep
M.grepprg = "rg --hidden --vimgrep --smart-case --"
-- set numbered lines
M.number = true
-- enable mouse see :h mouse
M.mouse = "a"
-- set relative numbered lines
M.relative_number = true
-- Noice heavily changes the Neovim UI ...
M.enable_noice = true
-- treesitter parsers to be installed
-- one of "all", "maintained" (parsers with maintainers), or a list of languages
M.treesitter_ensure_installed = {
    "bash",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "hcl",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "ledger",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "python",
    "regex",
    "terraform",
    "toml",
    "vim",
    "yaml",
}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
    "bashls",
    "dockerls",
    "jsonls",
    "ltex",
    "marksman",
    "pyright",
    "lua_ls",
    "terraformls",
    "texlab",
    "tsserver",
    "yamlls",
}

-- Tools that should be installed by Mason
M.tools = {
    -- Formatter
    "black",
    "prettier",
    "stylua",
    "shfmt",
    -- Linter
    "eslint_d",
    "shellcheck",
    "tflint",
    "yamllint",
    "ruff",
    -- DAP
    "debugpy",
}

-- enable greping in hidden files
M.telescope_grep_hidden = true

-- which patterns to ignore in file switcher
M.telescope_file_ignore_patterns = {
    "%.7z",
    "%.JPEG",
    "%.JPG",
    "%.MOV",
    "%.RAF",
    "%.burp",
    "%.bz2",
    "%.cache",
    "%.class",
    "%.dll",
    "%.docx",
    "%.dylib",
    "%.epub",
    "%.exe",
    "%.flac",
    "%.ico",
    "%.ipynb",
    "%.jar",
    "%.jpeg",
    "%.jpg",
    "%.lock",
    "%.mkv",
    "%.mov",
    "%.mp4",
    "%.otf",
    "%.pdb",
    "%.pdf",
    "%.png",
    "%.rar",
    "%.sqlite3",
    "%.svg",
    "%.tar",
    "%.tar.gz",
    "%.ttf",
    "%.webp",
    "%.zip",
    ".venv/",
    "venv/",
    ".git/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vale/",
    ".vscode/",
    "__pycache__/*",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "smalljre_*/*",
    "target/",
    "vendor/*",
}

return M
