local dap = require("dap")
local ui = require("dapui")

vim.keymap.set(
  "n",
  "<leader>db",
  dap.toggle_breakpoint,
  { desc = "Dap toggle breakpoint" }
)

vim.keymap.set("n", "<leader>dB", function()
  vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
    dap.set_breakpoint(input)
  end)
end, { desc = "Dap set conditional breakpoint" })

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Dap continue" })
vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Dap step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Dap step into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Dap step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Dap open repl" })
vim.keymap.set("n", "<leader>dd", dap.disconnect, { desc = "Dap disconnect" })

ui.setup()

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end

require("dap-go").setup()
