return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = true,
        highlights = {
          -- Git status colors in explorer/picker
          SnacksPickerGitStatusAdded = { fg = "$green" },
          SnacksPickerGitStatusUntracked = { fg = "$green" },
          SnacksPickerGitStatusModified = { fg = "$yellow" },
          SnacksPickerGitStatusDeleted = { fg = "$red" },
          SnacksPickerGitStatusRenamed = { fg = "$blue" },
          SnacksPickerGitStatusCopied = { fg = "$cyan" },
          -- Transparent tabline for bufferline
          TabLine = { bg = "none" },
          TabLineFill = { bg = "none" },
          TabLineSel = { bg = "none" },
        },
      })
      require("onedark").load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
