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
    "c",
    "commonlisp",
    "cmake",
    -- "comment", -- comments are slowing down TS bigtime, so disable for now
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "fennel",
    "fish",
    "gitignore",
    "git_rebase",
    "gitcommit",
    "gitattributes",
    "gomod",
    "gosum",
    "gowork",
    "go",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "jsdoc",
    "jsonc",
    "jq",
    "julia",
    "latex",
    "llvm",
    "lua",
    "luap",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "norg",
    "org",
    "php",
    "python",
    "query",
    "regex",
    "rust",
    "ruby",
    "scss",
    "sql",
    "swift",
    "toml",
    "terraform",
    "todotxt",
    "tsx",
    "typescript",
    "vim",
    "v",
    "vue",
    "wgsl",
    "yaml",
    "zig",
}

-- Mason ensure installed
M.mason_ensure_installed = {
    "lua_ls",
    "ltex",
    "marksman",
    "bashls",
    "yamlls",
    "jsonls",
    "dockerls",
    "pyright",
    -- "nimls", // Somehthing is wrong with this one, will need to look into why the server fails
    "terraformls",
    "zls",
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
