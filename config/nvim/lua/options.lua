require "nvchad.options"

-- add yours here!

-- highlight for markdown
vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#c792ea" })
vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#89ddff" })

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.conceallevel = 2
