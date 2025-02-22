local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports" },
        markdown = { nil },
        ["_"] = { "prettier" }, -- all other filetypes
    },

    -- format_on_save = {
    --     timeout_ms = 1000,
    --     lsp_format = "fallback",
    -- },
    --
    format_after_save = {
        lsp_format = "fallback",
    },
}

require("conform").setup(options)
