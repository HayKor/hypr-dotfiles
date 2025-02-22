return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.nvim",
        },
        opts = {},
        lazy = false,
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local ok, wf = pcall(require, "vim.lsp._watchfiles")
            if ok then
                -- disable lsp watcher. Too slow on linux
                wf._watchfunc = function()
                    return function() end
                end
            end
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
            filters = {
                dotfiles = true,
                git_ignored = true,
            },
        },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "Obsidian",
                    path = "~/Obsidian/",
                },
            },
            daily_notes = {
                folder = "2. Ежедневные заметки",
                date_format = "%d %b, %Y",
                alias_format = "%d %b, %Y",
                default_tags = { "Daily" },
                template = "Шаблоны/Daily notes.md",
            },
            disable_frontmatter = true,
            templates = {
                folder = "Шаблоны",
                date_format = "%d %b, %Y",
                time_format = "%H:%M",
                substitutions = {},
            },
            attachments = {
                img_folder = "Вложения", -- This is the default

                ---@return string
                img_name_func = function()
                    return string.format("%s-", os.time())
                end,

                ---@param client obsidian.Client
                ---@param path obsidian.Path the absolute path to the image file
                ---@return string
                img_text_func = function(client, path)
                    path = client:vault_relative_path(path) or path
                    return string.format("![%s](%s)", path.name, path)
                end,
            },
            ui = {
                enable = true, -- set to false to disable all additional syntax features
                update_debounce = 200, -- update delay after a text change (in milliseconds)
                max_file_length = 5000, -- disable UI features for files with more than this many lines
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    ["!"] = { char = "", hl_group = "ObsidianImportant" },
                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                -- Use bullet marks for non-checkbox lists.
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = {
                    char = "",
                    hl_group = "ObsidianExtLinkIcon",
                },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                block_ids = { hl_group = "ObsidianBlockID" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianImportant = { bold = true, fg = "#d73128" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianBlockID = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },

                    -- CUSTOM
                    ObsidianBold = { bold = true, fg = "#c792ea" },
                    ObsidianItalic = { bold = true, fg = "#c792ea" },
                },
            },
        },
    },
    {
        "epwalsh/pomo.nvim",
        version = "*", -- Recommended, use latest release instead of latest commit
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
        dependencies = {
            -- Optional, but highly recommended if you want to use the "Default" timer
            "rcarriga/nvim-notify",
        },
        opts = {
            update_interval = 1000,
            notifiers = {
                -- The "Default" notifier uses 'vim.notify' and works best when you have 'nvim-notify' installed.
                {
                    name = "Default",
                    opts = {
                        -- With 'nvim-notify', when 'sticky = true' you'll have a live timer pop-up
                        -- continuously displayed. If you only want a pop-up notification when the timer starts
                        -- and finishes, set this to false.
                        sticky = true,

                        -- Configure the display icons:
                        title_icon = "󱎫",
                        text_icon = "󰄉",
                        -- Replace the above with these if you don't have a patched font:
                        -- title_icon = "⏳",
                        -- text_icon = "⏱️",
                    },
                },

                { name = "System" },
            },

            timers = {
                Break = {
                    { name = "System" },
                },
            },
            sessions = {
                pomodoro = {
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Long Break", duration = "15m" },
                },
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
