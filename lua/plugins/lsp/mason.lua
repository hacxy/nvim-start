return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "html",
      "ts_ls",
      "lua_ls",
      "stylua",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}
