require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jj", "<ESC>")

--- Make a new runner
map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").runner {
        id = "runner",
        pos = "sp",
        cmd = function()
            local file = vim.fn.expand "%"

            local ft_cmds = {
                python = "source .venv/bin/activate.fish && "
                    .. "python3 "
                    .. file
                    .. " && exit",
                cpp = "clear && g++ -o out "
                    .. file
                    .. " && ./out"
                    .. " && rm -f out"
                    .. " && exit",
                lua = "lua5.4 " .. file .. " && exit",
            }
            return ft_cmds[vim.bo.ft]
        end,
        clear_cmd = true,
    }
end, { desc = "Toggle Terminal Runner" })

--- Toggle a Terminal
map({ "n", "t" }, "<A-t>", function()
    require("nvchad.term").toggle { pos = "sp", id = "term" }
end, { desc = "Terminal Toggle" })

--- Toggle lazygit in float Terminal
-- nomap({ "n", "t" }, "<Leader>gt")
map({ "n", "t" }, "<A-l>", function()
    require("nvchad.term").toggle {
        pos = "float",
        id = "lazygit",
        cmd = "lazygit",
        float_opts = {
            relative = "editor",
            row = 0.05,
            col = 0.05,
            width = 0.85,
            height = 0.85,
            border = "rounded",
        },
        -- float_opts = {
        --     relative = "editor",
        --     row = 0,
        --     col = 0,
        --     width = 1,
        --     height = 1,
        --     border = "single",
        -- },
    }
end, { desc = "Toggle floating LazyGit window" })

--- Copy and Paste to the clipboard
nomap("n", "<Leader>pt") -- remove "Pick terminal" hotkey
map({ "n", "v" }, "<Leader>y", '"+y', { desc = "Copy to clipboard" })
map({ "n", "v" }, "<Leader>Y", '"+yy', { desc = "Copy line to clipboard" })
map({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<Leader>P", '"+P', { desc = "Paste from clipboard" })
