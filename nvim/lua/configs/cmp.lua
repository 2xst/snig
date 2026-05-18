require("blink.cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  completion = {
    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          { "label" },
        },
        components = {
          label = {
            width = {
              max = 30,
            },
          },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 50,
    },
  },
  sources = {
    providers = {
      lsp = {
        timeout_ms = 50,
      },
    },
  },
  keymap = {
    preset = "enter",
    ["<C-j>"] = { "select_next", "fallback_to_mappings" },
    ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
  },
  cmdline = {
    keymap = {
      ["<Tab>"] = { "show_and_insert_or_accept_single", "select_next" },
      ["<S-Tab>"] = { "show_and_insert_or_accept_single", "select_prev" },
      ["<C-space>"] = { "show", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Right>"] = { "select_next", "fallback" },
      ["<Left>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
    },
  },
})
