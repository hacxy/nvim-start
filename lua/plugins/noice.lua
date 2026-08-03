return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
    lsp = {
      hover = {
        silent = true, -- 没有信息时不弹提示
      },
    },
  },
}
