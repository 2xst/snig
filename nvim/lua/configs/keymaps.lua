vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "Quick esc" })

vim.keymap.set("c", "<M-BS>", "<C-w>", { desc = "Option backspace" })
vim.keymap.set("c", "<M-Left>", "<S-Left>", { desc = "Option left" })
vim.keymap.set("c", "<M-Right>", "<S-Right>", { desc = "Option right" })

vim.keymap.set("v", "<", "<gv", { desc = "Quick shift left" })
vim.keymap.set("v", ">", ">gv", { desc = "Quick shift right" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste keeping old buffer" })
