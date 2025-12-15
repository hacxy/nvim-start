-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, but recommended
  },
  keys = {
    {
      '<leader>e',
      function()
        -- 使用 reveal 命令：如果文件树未打开则打开并聚焦到当前文件，如果已打开则聚焦到当前文件
        -- 如果需要关闭，可以在文件树窗口内按 <leader>e
        vim.cmd.Neotree 'reveal'
      end,
      desc = '打开文件树（聚焦到当前文件）',
      silent = true,
    },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true, -- 如果是最后一个窗口则关闭
      filesystem = {
        window = {
          mappings = {
            ['<leader>e'] = 'close_window',
            ['<space>'] = nil, -- 移除 space 键的映射
          },
        },

        -- 打开文件后自动关闭文件树
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
        -- 打开文件树时自动聚焦到当前文件
        follow_current_file = {
          enabled = true, -- 启用聚焦到当前文件
          leave_dirs_open = false, -- 关闭时折叠目录
        },
      },
      -- 监听文件打开事件，自动关闭窗口
      event_handlers = {
        {
          event = 'file_opened',
          handler = function()
            -- 打开文件后关闭 neo-tree
            vim.cmd.Neotree 'close'
          end,
        },
      },
    }
  end,
}
