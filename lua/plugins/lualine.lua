return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local colors = {
        blue = "#61afef",
        green = "#98c379",
        purple = "#c678dd",
        cyan = "#56b6c2",
        red1 = "#e06c75",
        yellow = "#e5c07b",
        fg = "#abb2bf",
        bg = "NONE",
        gray1 = "#828997",
        gray2 = "NONE",
        gray3 = "NONE",
      }

      opts.options.theme = {
        normal = {
          a = { fg = "#282c34", bg = colors.green, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray3 },
          c = { fg = colors.fg, bg = colors.gray2 },
          z = { fg = "#282c34", bg = colors.green, gui = "bold" },
        },
        command = { a = { fg = "#282c34", bg = colors.yellow, gui = "bold" } },
        insert = { a = { fg = "#282c34", bg = colors.blue, gui = "bold" } },
        visual = { a = { fg = "#282c34", bg = colors.purple, gui = "bold" } },
        terminal = {
          a = { fg = "#282c34", bg = colors.cyan, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray3 },
          c = { fg = colors.fg, bg = colors.gray2 },
          z = { fg = "#282c34", bg = colors.cyan, gui = "bold" },
        },
        replace = { a = { fg = "#282c34", bg = colors.red1, gui = "bold" } },
        inactive = {
          a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
          b = { fg = colors.gray1, bg = colors.bg },
          c = { fg = colors.gray1, bg = colors.gray2 },
        },
      }
    end,
  },
}
