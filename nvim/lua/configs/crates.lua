vim.api.nvim_create_autocmd("BufRead", {
  pattern = "Cargo.toml",
  callback = function()
    local crates = require("crates")

    crates.setup()

    local function twice(f)
      return function()
        f()
        f()
      end
    end

    vim.keymap.set(
      "n",
      "<leader>s",
      [[:s/{.*version.*=.*\("[0-9\.]\+"\).*}/\1<CR>]],
      { buffer = true, desc = "Simplify to version" }
    )

    vim.keymap.set(
      "n",
      "<leader>T",
      crates.toggle,
      { buffer = true, desc = "Crates toggle" }
    )
    vim.keymap.set(
      "n",
      "<leader>R",
      crates.reload,
      { buffer = true, desc = "Crates reload" }
    )

    vim.keymap.set(
      "n",
      "fv",
      twice(crates.show_versions_popup),
      { buffer = true, desc = "Crates show versions popup)" }
    )
    vim.keymap.set(
      "n",
      "ff",
      twice(crates.show_features_popup),
      { buffer = true, desc = "Crates show features popup)" }
    )
    vim.keymap.set(
      "n",
      "fd",
      twice(crates.show_dependencies_popup),
      { buffer = true, desc = "Crates show dependencies popup)" }
    )

    vim.keymap.set(
      "n",
      "<leader>u",
      crates.update_crate,
      { buffer = true, desc = "Crates update crate" }
    )
    vim.keymap.set(
      "n",
      "<leader>a",
      crates.update_all_crates,
      { buffer = true, desc = "Crates update all crates" }
    )
    vim.keymap.set(
      "n",
      "<leader>U",
      crates.upgrade_crate,
      { buffer = true, desc = "Crates upgrade crate" }
    )
    vim.keymap.set(
      "n",
      "<leader>A",
      crates.upgrade_all_crates,
      { buffer = true, desc = "Crates upgrade all crates" }
    )

    vim.keymap.set(
      "v",
      "<leader>u",
      crates.update_crates,
      { buffer = true, desc = "Crates update crates" }
    )
    vim.keymap.set(
      "v",
      "<leader>U",
      crates.upgrade_crates,
      { buffer = true, desc = "Crates upgrade crates" }
    )

    vim.keymap.set(
      "n",
      "<leader>x",
      crates.extract_crate_into_table,
      { buffer = true, desc = "Crates extract crate into table" }
    )
    vim.keymap.set(
      "n",
      "<leader>t",
      crates.expand_plain_crate_to_inline_table,
      { buffer = true, desc = "Crates expand plain crate to inline table" }
    )

    vim.keymap.set(
      "n",
      "<leader>h",
      crates.open_homepage,
      { buffer = true, desc = "Crates open homepage" }
    )
    vim.keymap.set(
      "n",
      "<leader>r",
      crates.open_repository,
      { buffer = true, desc = "Crates open repository" }
    )
    vim.keymap.set(
      "n",
      "<leader>d",
      crates.open_documentation,
      { buffer = true, desc = "Crates open documentation" }
    )
    vim.keymap.set(
      "n",
      "<leader>c",
      crates.open_crates_io,
      { buffer = true, desc = "Crates open crates io" }
    )
  end,
})
