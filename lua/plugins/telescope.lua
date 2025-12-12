-- 注意：插件可以指定依赖项。
--
-- 依赖项也是适当的插件规范 - 任何
-- 你在顶层为插件做的事情，你也可以为依赖项做。
--
-- 使用 `dependencies` 键指定特定插件的依赖项

return { -- 模糊查找器（文件、lsp 等）
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- 如果遇到错误，请参阅 telescope-fzf-native README 获取安装说明
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` 用于在安装/更新插件时运行某些命令。
      -- 这仅在此时运行，而不是每次 Neovim 启动时都运行。
      build = 'make',

      -- `cond` 是用于确定是否应该安装和加载此插件的条件。
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- 用于获取漂亮图标，但需要 Nerd Font。
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope 是一个模糊查找器，带有许多不同的功能
    -- 它可以模糊查找！它不仅仅是"文件查找器"，它可以搜索
    -- Neovim、你的工作区、LSP 等的许多不同方面！
    --
    -- 使用 Telescope 最简单的方法是先执行类似以下操作：
    --  :Telescope help_tags
    --
    -- 运行此命令后，将打开一个窗口，你可以
    -- 在提示窗口中输入。你将看到 `help_tags` 选项列表和
    -- 相应的帮助预览。
    --
    -- 在 Telescope 中使用的两个重要快捷键映射是：
    --  - 插入模式：<c-/>
    --  - 普通模式：?
    --
    -- 这将打开一个窗口，显示当前
    -- Telescope 选择器的所有快捷键映射。这对于发现 Telescope 可以
    -- 做什么以及如何实际执行非常有用！

    -- [[ 配置 Telescope ]]
    -- 参见 `:help telescope` 和 `:help telescope.setup()`
    require('telescope').setup {
      -- 你可以在这里放置默认映射 / 更新 / 等
      --  你正在寻找的所有信息都在 `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- 如果已安装，则启用 Telescope 扩展
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- 参见 `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- 覆盖默认行为和主题的稍微高级的示例
    vim.keymap.set('n', '<leader>/', function()
      -- 你可以向 Telescope 传递其他配置以更改主题、布局等。
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] 在当前缓冲区中模糊搜索' })

    -- 也可以传递其他配置选项。
    --  有关特定键的信息，请参见 `:help telescope.builtin.live_grep()`
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- 搜索 Neovim 配置文件的快捷方式
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
