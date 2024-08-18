return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "black",
                "pylint",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "python",
                "bash",
            },
        },
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                mode = "background",
                RGB = true, -- Enable RGB color notation support
                RRGGBB = true, -- Enable RRGGBB color notation support
                names = false, -- Enable color name highlighting (e.g., "red", "blue", etc.)
                css = true, -- Disable CSS color notation support
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            view = {
                width = 25,
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
        },
    },
}
