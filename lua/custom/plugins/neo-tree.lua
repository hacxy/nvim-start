-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '<leader>e',
      function()
        -- 使用 reveal 命令：如果文件树未打开则打开并聚焦到当前文件，如果已打开则聚焦到当前文件
        -- 如果需要关闭，可以在文件树窗口内按 <leader>e
        vim.cmd.Neotree('reveal')
      end,
      desc = '打开文件树（聚焦到当前文件）',
      silent = true,
    },
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true, -- 如果是最后一个窗口则关闭
      filesystem = {
        window = {
          mappings = {
            ['<leader>e'] = 'close_window',
            ['<space>'] = false, -- 移除 space 键的映射
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
            vim.cmd.Neotree('close')
          end,
        },
      },
    })
  end,
  init = function()
    -- 确保启动时文件树是关闭的（如果之前会话中有打开）
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        -- 延迟执行，确保所有插件都已加载
        vim.defer_fn(function()
          local success, _ = pcall(vim.cmd.Neotree, 'close')
        end, 100)
      end,
      once = true,
    })
  end,
}
