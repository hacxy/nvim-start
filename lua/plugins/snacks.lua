local find_project_root = require('utils.path')

local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and '<c-' .. dir .. '>' or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
    words = { enabled = true },
    indent = {
      priority = 1,
      enabled = true, -- enable indent guides
      char = '│',
      only_scope = false, -- only show indent guides of the scope
      only_current = false, -- only show indent guides in the current window
      hl = 'SnacksIndent', ---@type string|string[] hl groups for indent guides
    },

    scope = {
      enabled = true, -- enable highlighting the current scope
      priority = 200,
      char = '│',
      underline = false, -- underline the start of the scope
      only_current = false, -- only show scope in the current window
      hl = 'SnacksIndentScope', ---@type string|string[] hl group for scopes
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the
      -- top-level scope which will be rendered as a scope.
      enabled = false,
      -- only show chunk scopes in the current window
      only_current = false,
      priority = 200,
      hl = 'SnacksIndentChunk', ---@type string|string[] hl group for chunk scopes
      char = {
        corner_top = '┌',
        corner_bottom = '└',
        -- corner_top = "╭",
        -- corner_bottom = "╰",
        horizontal = '─',
        vertical = '│',
        arrow = '>',
      },
    },

    terminal = {
      enabled = true,
      win = {
        keys = {
          nav_h = { '<C-h>', term_nav('h'), desc = 'Go to Left Window', expr = true, mode = 't' },
          nav_j = { '<C-j>', term_nav('j'), desc = 'Go to Lower Window', expr = true, mode = 't' },
          nav_k = { '<C-k>', term_nav('k'), desc = 'Go to Upper Window', expr = true, mode = 't' },
          nav_l = { '<C-l>', term_nav('l'), desc = 'Go to Right Window', expr = true, mode = 't' },
        },
      },
    },
    statuscolumn = {
      enabled = true,
      folds = { open = true, git_hl = true },
    },
  },
  keys = {
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = 'Find Config File',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files({ cwd = find_project_root() })
      end,
      desc = 'Find Files(Root Dir)',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_files()
      end,
      desc = 'Find Git Files',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = 'Recent',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit({ cwd = Snacks.git.get_root() })
      end,
      desc = 'Open lazygit',
    },
    {
      '<c-_>',
      function()
        Snacks.terminal(nil, { cwd = find_project_root() })
      end,
      desc = 'Terminal (Root Dir)',
      mode = { 'n' },
    },
    {
      '<c-_>',
      '<cmd>close<cr>',
      desc = 'which_key_ignore',
      mode = 't',
    },
  },
}
