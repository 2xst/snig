return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      check = {
        command = "clippy",
      },
      completion = {
        postfix = { enable = false },
      },
      files = {
        excludeDirs = { ".direnv" },
      },
    },
  },
}
