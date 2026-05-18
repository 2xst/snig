vim.o.termguicolors = true
vim.o.wrap = false
vim.o.pumheight = 15
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.hlsearch = false

vim.api.nvim_set_hl(0, "SnippetTabstop", {})
vim.api.nvim_set_hl(0, "SnippetTabstopActive", {})

require("vim._core.ui2").enable({ enable = true })
