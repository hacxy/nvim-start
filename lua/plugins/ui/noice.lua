return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    sections = {
      lualine_x = {
        {
          require('noice').api.statusline.mode.get,
          cond = require('noice').api.statusline.mode.has,
          color = { fg = '#ff9e64' },
        },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  -- enabled = false,
}
