return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  opts = {
    options = {
      -- mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  keys = {
    { "H", ":BufferLineCyclePrev<CR>", silent = true, desc = "跳转到上一个buffer" },
    { "L", ":BufferLineCycleNext<CR>", silent = true, desc = "跳转到下一个buffer" },
    { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true, desc = "关闭其他buffer" },
    { "<leader>bp", ":BufferLinePick<CR>", silent = true, desc = "选择进入一个buffer" },
    { "<leader>bd", ":bdelete<CR>", silent = true, desc = "关闭当前buffer" },
  },
}
