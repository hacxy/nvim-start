return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'html',
          'ts_ls',
          'lua_ls',
          'stylua',
          'eslint',
          'prettier',
          'stylelint_lsp',
        },
      },
    },
    {
      'mason-org/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    {
      'neovim/nvim-lspconfig',
    },
  },
}
