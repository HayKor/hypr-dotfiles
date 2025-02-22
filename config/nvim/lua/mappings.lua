require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map(
    "n",
    "<Leader>to",
    ":TodoTelescope<CR>",
    { desc = "Find TODOs with Telescope" }
)

-- LuaSnip
-- local ls = require "luasnip"
-- map({ "i" }, "<C-K>", function()
--     ls.expand()
-- end, { silent = true })
-- map({ "i", "s" }, "<C-L>", function()
--     ls.jump(1)
-- end, { silent = true })
-- map({ "i", "s" }, "<C-J>", function()
--     ls.jump(-1)
-- end, { silent = true })
--
-- map({ "i", "s" }, "<C-E>", function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end, { silent = true })

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
                go = "go run " .. file .. " && exit",
                c = "clear && gcc -o out "
                    .. file
                    .. " && ./out"
                    .. " && rm -f out"
                    .. " && exit",
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
    }
end, { desc = "Toggle floating LazyGit window" })

map({ "n", "t" }, "<A-d>", function()
    require("nvchad.term").toggle {
        pos = "float",
        id = "lazydocker",
        cmd = "lazydocker",
        float_opts = {
            relative = "editor",
            row = 0.05,
            col = 0.05,
            width = 0.85,
            height = 0.85,
            border = "rounded",
        },
    }
end, { desc = "Toggle floating LazyDocker window" })

--- Copy and Paste to the clipboard
nomap("n", "<Leader>pt") -- remove "Pick terminal" hotkey
map({ "n", "v" }, "<Leader>y", '"+y', { desc = "Copy to clipboard" })
map({ "n", "v" }, "<Leader>Y", '"+yy', { desc = "Copy line to clipboard" })
map({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<Leader>P", '"+P', { desc = "Paste from clipboard" })

-- keys = {
--     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
-- },
map({ "n", "v" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
map({ "n", "v" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>")
