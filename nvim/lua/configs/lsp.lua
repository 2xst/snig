local null_ls = require("null-ls")

vim.lsp.enable({
  "jsonls",
  "tailwindcss",
  "dockerls",
  "bashls",
  "ccls",
  "nil_ls",
  "gopls",
  "ts_ls",
  "lua_ls",
  "rust_analyzer",
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.nix_flake_fmt,
    null_ls.builtins.code_actions.gitsigns,
  },
})

vim.diagnostic.config({
  severity_sort = true,
})

local function set_format_keymap(mode, lhs, opts)
  local function schedule_set_buf_format(format_opts)
    vim.schedule(function()
      local function format()
        vim.lsp.buf.format({ filter = format_opts.filter })
      end
      local extended_opts =
        vim.tbl_deep_extend("force", opts, { desc = format_opts.desc })
      vim.keymap.set(mode, lhs, format, extended_opts)
    end)
  end

  local function schedule_set_nix_fmt_format()
    schedule_set_buf_format({
      desc = "Format with nix fmt",
      filter = function(client)
        return client.name == "null-ls"
      end,
    })
  end

  local function schedule_set_lsp_format()
    schedule_set_buf_format({
      desc = "Format with native LSP",
      filter = function(client)
        return client.name ~= "null-ls"
      end,
    })
  end

  vim.system(
    { "nix", "flake", "show", "--json" },
    { text = true },
    function(flake_outputs)
      if flake_outputs.code == 0 then
        vim.system(
          { "jq", "-e", ".formatter" },
          { text = true, stdin = flake_outputs.stdout },
          function(formatter_output)
            if formatter_output.code == 0 then
              schedule_set_nix_fmt_format()
            else
              schedule_set_lsp_format()
            end
          end
        )
      else
        schedule_set_lsp_format()
      end
    end
  )
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Additional lsp keymaps",
  callback = function(event)
    set_format_keymap("n", "gqq", { buffer = event.buf })

    vim.keymap.set(
      "n",
      "gl",
      vim.diagnostic.open_float,
      { buffer = event.buf, desc = "Lsp diagnostics" }
    )

    vim.keymap.set(
      "n",
      "gd",
      vim.lsp.buf.definition,
      { buffer = event.buf, desc = "Lsp diagnostics" }
    )

    vim.keymap.set(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      { buffer = event.buf, desc = "Lsp diagnostics" }
    )

    vim.keymap.set(
      "v",
      "gra",
      vim.lsp.buf.code_action,
      { buffer = event.buf, desc = "Lsp code actions" }
    )
  end,
})

-- Supress null-ls warning
local original_notify = vim.notify
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
  -- Disable nix fmt warnings
  if msg:find("unable to build 'nix fmt' entrypoint") then
    return
  end
  original_notify(msg, level, opts)
end
