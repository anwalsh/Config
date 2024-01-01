return {
    -- theme: nightfox, carbonfox, oxocarbon, kanagawa, catppuccin; default is carbonfox
    -- refer to the themes settings file for different styles
    theme = "carbonfox",
    -- use rg instead of grep
    grepprg = "rg --hidden --vimgrep --smart-case --",
    -- set numbered lines
    number = true,
    -- enable mouse see :h mouse
    mouse = "a",
    -- set relative numbered lines
    relative_number = true,
    -- Noice heavily changes the Neovim UI ...
    enable_noice = true,
    -- treesitter parsers to be installed
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    treesitter_ensure_installed = {
        "bash",
        "c",
        "clojure",
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
        "luadoc",
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
    },

    -- Mason ensure installed
    mason_ensure_installed = {
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
    },

    -- enable greping in hidden files
    telescope_grep_hidden = true,

    -- which patterns to ignore in file switcher
    telescope_file_ignore_patterns = {
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
    },

    -- icons used by other plugins
    -- stylua: ignore
    icons = {
        misc = {
            dots = "󰇘",
        },
        dap = {
            Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint          = " ",
            BreakpointCondition = " ",
            BreakpointRejected  = { " ", "DiagnosticError" },
            LogPoint            = ".>",
        },
        diagnostics = {
            Error = " ",
            Warn  = " ",
            Hint  = " ",
            Info  = " ",
        },
        git = {
            added    = " ",
            modified = " ",
            removed  = " ",
        },
        kinds = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Codeium       = "󰘦 ",
            Color         = " ",
            Control       = " ",
            Collapsed     = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Copilot       = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Folder        = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Keyword       = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            Reference     = " ",
            Snippet       = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TabNine       = "󰏚 ",
            Text          = " ",
            TypeParameter = " ",
            Unit          = " ",
            Value         = " ",
            Variable      = "󰀫 ",
        },
    },
    ---@type table<string, string[]|boolean>?
    kind_filter = {
        default = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
        },
        markdown = false,
        help = false,
        -- you can specify a different filter for each filetype
        lua = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            -- "Package", -- remove package since luals uses it for control flow structures
            "Property",
            "Struct",
            "Trait",
        },
    },
}