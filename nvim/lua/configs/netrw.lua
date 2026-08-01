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

-- TODO remove 26.11 https://github.com/prichrd/netrw.nvim/pull/43
local function render_netrw_icons()
  vim.schedule(function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.bo[bufnr].filetype == "netrw" then
      require("netrw.ui").embelish(bufnr)
      require("netrw.actions").bind(bufnr)
    end
  end)
end

vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = render_netrw_icons,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = render_netrw_icons,
})
