return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = { "saghen/blink.cmp" },
  config = function(_)
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.diagnostic.config { update_in_insert = true, virtual_text = true }
  end,
}
