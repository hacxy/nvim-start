return { -- 显示待处理快捷键绑定的有用插件。
  'folke/which-key.nvim',
  event = 'VimEnter', -- 将加载事件设置为 'VimEnter'
  opts = {
    -- 按键和打开 which-key 之间的延迟（毫秒）
    -- 此设置独立于 vim.o.timeoutlen
    delay = 0,
    icons = {
      -- 如果你有 Nerd Font，将图标映射设置为 true
      mappings = vim.g.have_nerd_font,
      -- 如果你使用 Nerd Font：将 icons.keys 设置为空表，将使用
      -- 默认的 which-key.nvim 定义的 Nerd Font 图标，否则定义一个字符串表
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- 记录现有的键链
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
