return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    -- config = function()
    --   vim.cmd([[colorscheme tokyonight]])
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      auto_integrations = true,
    },
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
