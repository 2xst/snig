vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0
vim.g.netrw_winsize = 30
vim.g.netrw_list_hide = [[^\./$,^\.\./$]]
vim.g.netrw_hide = 1

vim.keymap.set("n", "-", function()
  vim.cmd.Ex()
  -- focus current file
  vim.fn.search(vim.fn.expand("#:t"))
end, { desc = "Open Netrw" })

require("netrw").setup({ use_devicons = true })
