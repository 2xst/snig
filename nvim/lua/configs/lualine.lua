require("lualine").setup({
  options = {
    globalstatus = true,
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    -- somehow removes the icon completely
    -- falsy values don't work
    lualine_z = { { "branch", icon = { align = "right" } } },
  },
})
