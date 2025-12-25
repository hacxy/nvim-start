return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = { 'saghen/blink.cmp' },
  opts = {},
  config = function(_)
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.lsp.config('*', {
      capabilities = capabilities,
    })
    vim.diagnostic.config({ update_in_insert = true, virtual_text = true })
  end,
}
