local fff = require("fff")

fff.setup({
  prompt = "> ",
  title = "Files",
  history = {
    enabled = false,
  },
  grep = {
    modes = { "plain", "fuzzy" },
  },
  keymaps = {
    move_down = { "<Down>", "<C-j>" },
    move_up = { "<Up>", "<C-k>" },
    cycle_previous_query = "<C-n>",
  },
  layout = {
    width = 1,
    height = 1,
    prompt_position = "top",
    preview_position = "top",
  },
})

vim.keymap.set("n", "<leader>f", fff.find_files, { desc = "FFF files" })

vim.keymap.set("n", "<leader>gg", fff.live_grep, { desc = "FFF grep" })

vim.keymap.set("n", "<leader>gw", function()
  fff.live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "FFF grep word" })

vim.keymap.set(
  "n",
  "<leader>rf",
  fff.scan_files,
  { desc = "FFF refresh file tree" }
)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "fffile search",
  callback = function(ev)
    vim.keymap.set(
      "n",
      "jk",
      require("fff.picker_ui").close,
      { buffer = ev.buf, desc = "Quick esc" }
    )
  end,
})
