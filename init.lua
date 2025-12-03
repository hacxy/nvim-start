--[[

=====================================================================
==================== 继续之前请先阅读 ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

什么是 Kickstart？

  Kickstart.nvim *不是* 一个发行版。

  Kickstart.nvim 是你自己配置的起点。
    目标是你可以从上到下阅读每一行代码，理解
    你的配置在做什么，并根据需要修改它。

    完成这些后，你可以开始探索、配置和调整，
    让 Neovim 成为你自己的！这可能意味着暂时保持 Kickstart 原样
    或者立即将其拆分为模块化组件。这取决于你！

    如果你对 Lua 一无所知，我建议花一些时间阅读
    一份指南。一个可能只需要 10-15 分钟的例子：
      - https://learnxinyminutes.com/docs/lua/

    在更了解 Lua 之后，你可以使用 `:help lua-guide` 作为
    Neovim 如何集成 Lua 的参考。
    - :help lua-guide
    - (或 HTML 版本): https://neovim.io/doc/user/lua-guide.html

Kickstart 指南：

  待办事项：你应该做的第一件事是在 Neovim 中运行命令 `:Tutor`。

    如果你不知道这意味着什么，请按以下步骤操作：
      - <escape 键>
      - :
      - Tutor
      - <enter 键>

    (如果你已经了解 Neovim 基础知识，可以跳过此步骤。)

  完成后，你可以继续**阅读** kickstart init.lua 的其余部分。

  接下来，运行并阅读 `:help`。
    这将打开一个帮助窗口，其中包含一些基本信息
    关于阅读、导航和搜索内置帮助文档。

    这应该是你在遇到困难或困惑时首先查看的地方。
    这是我最喜欢的 Neovim 功能之一。

    最重要的是，我们提供了一个快捷键映射 "<space>sh" 来[s]earch [h]elp 文档，
    当你不太确定要查找什么时，这非常有用。

  我在整个 init.lua 中留下了几个 `:help X` 注释
    这些提示了在哪里可以找到有关 Kickstart 中使用的相关设置、
    插件或 Neovim 功能的更多信息。



   注意：查找类似这样的行

    贯穿整个文件。这些是为了帮助你，读者，理解正在发生的事情。
    一旦你知道自己在做什么，可以随时删除它们，但它们应该作为指南
    当你第一次在 Neovim 配置中遇到一些不同的结构时。

如果你在尝试安装 kickstart 时遇到任何错误，请运行 `:checkhealth` 获取更多信息。

希望你享受你的 Neovim 之旅，
- TJ

附言：完成后你也可以删除这个。现在这是你的配置了！ :)
--]]

---@diagnostic disable: undefined-global

-- 将 <space> 设置为 leader 键
-- 参见 `:help mapleader`
--  注意：必须在加载插件之前设置（否则会使用错误的 leader 键）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 如果你在终端中安装并选择了 Nerd Font，请设置为 true
vim.g.have_nerd_font = true

-- [[ 设置选项 ]]
-- 参见 `:help vim.o`
-- 注意：你可以根据需要更改这些选项！
--  更多选项，请参见 `:help option-list`

-- 默认显示行号
vim.o.number = true
-- 你也可以添加相对行号，以帮助跳转。
--  自己尝试一下，看看你是否喜欢它！
-- vim.o.relativenumber = true

-- 启用鼠标模式，例如调整分割窗口大小很有用！
vim.o.mouse = 'a'

-- 不显示模式，因为它已经在状态栏中
vim.o.showmode = false

-- 在操作系统和 Neovim 之间同步剪贴板。
--  在 `UiEnter` 之后安排设置，因为它可能会增加启动时间。
--  如果你希望操作系统的剪贴板保持独立，请删除此选项。
--  参见 `:help 'clipboard'`

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- 启用断行缩进
vim.o.breakindent = true

-- 保存撤销历史
vim.o.undofile = true

-- 不区分大小写搜索，除非搜索词中有 \C 或一个或多个大写字母
vim.o.ignorecase = true
vim.o.smartcase = true

-- 默认保持符号列开启
vim.o.signcolumn = 'yes'

-- 减少更新时间
vim.o.updatetime = 250

-- 减少映射序列等待时间
vim.o.timeoutlen = 300

-- 配置如何打开新的分割窗口
vim.o.splitright = true
vim.o.splitbelow = true

-- 设置 neovim 如何在编辑器中显示某些空白字符。
--  参见 `:help 'list'`
--  和 `:help 'listchars'`
--
--  注意 listchars 使用 `vim.opt` 而不是 `vim.o` 设置。
--  它与 `vim.o` 非常相似，但提供了一个接口来方便地与表交互。
--   参见 `:help lua-options`
--   和 `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 实时预览替换，在你输入时！
vim.o.inccommand = 'split'

-- 显示光标所在的行
vim.o.cursorline = true

-- 在光标上方和下方保持的最小屏幕行数。
vim.o.scrolloff = 10

-- 如果由于缓冲区中有未保存的更改而执行操作会失败（如 `:q`），
-- 则弹出一个对话框询问你是否希望保存当前文件
-- 参见 `:help 'confirm'`
vim.o.confirm = true

-- [[ 基本快捷键映射 ]]
--  参见 `:help vim.keymap.set()`

-- 在普通模式下按 <Esc> 时清除搜索高亮
--  参见 `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- 诊断快捷键映射
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '打开诊断 [Q]uickfix 列表' })

-- 在内置终端中使用一个更容易发现的快捷键退出终端模式。
-- 否则，你通常需要按 <C-\><C-n>，这
-- 不是没有更多经验的人会猜到的。
--
-- 注意：这在所有终端模拟器/tmux/等中都不会工作。尝试你自己的映射
-- 或者直接使用 <C-\><C-n> 退出终端模式
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = '退出终端模式' })

-- 提示：在普通模式下禁用方向键
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- 使分割窗口导航更容易的快捷键绑定。
--  使用 CTRL+<hjkl> 在窗口之间切换
--
--  所有窗口命令列表，请参见 `:help wincmd`
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = '将焦点移动到左侧窗口' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = '将焦点移动到右侧窗口' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = '将焦点移动到下方窗口' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = '将焦点移动到上方窗口' })

-- 注意：某些终端有冲突的快捷键映射或无法发送不同的键码
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "将窗口移动到左侧" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "将窗口移动到右侧" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "将窗口移动到下方" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "将窗口移动到上方" })

-- [[ 安装 `lazy.nvim` 插件管理器 ]]
--    更多信息请参见 `:help lazy.nvim.txt` 或 https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('克隆 lazy.nvim 时出错:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ 配置和安装插件 ]]
--
--  要检查插件的当前状态，请运行
--    :Lazy
--
--  你可以在此菜单中按 `?` 获取帮助。使用 `:q` 关闭窗口
--
--  要更新插件，你可以运行
--    :Lazy update
--
-- 注意：这里是你安装插件的地方。
require('lazy').setup({
  -- 注意：插件可以通过链接添加（或对于 github 仓库：'owner/repo' 链接）。
  'NMAC427/guess-indent.nvim', -- 自动检测 tabstop 和 shiftwidth

  -- 注意：插件也可以通过使用表来添加，
  -- 第一个参数是链接，以下
  -- 键可用于配置插件行为/加载等。
  --
  -- 使用 `opts = {}` 自动将选项传递给插件的 `setup()` 函数，强制加载插件。
  --

  -- 或者，使用 `config = function() ... end` 完全控制配置。
  -- 如果你更喜欢显式调用 `setup`，请使用：
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- 你的 gitsigns 配置在这里
  --            })
  --        end,
  --    }
  --
  -- 这是一个更高级的示例，我们向 `gitsigns.nvim` 传递配置
  -- 选项。
  --
  -- 参见 `:help gitsigns` 了解配置键的作用
  { -- 在符号列中添加 git 相关符号，以及用于管理更改的工具
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- 注意：插件也可以配置为在加载时运行 Lua 代码。
  --
  -- 这对于分组配置以及处理
  -- 不需要在启动时立即加载的延迟加载插件非常有用。
  --
  -- 例如，在以下配置中，我们使用：
  --  event = 'VimEnter'
  --
  -- 这会在所有 UI 元素加载之前加载 which-key。事件可以是
  -- 普通的自动命令事件（`:help autocmd-events`）。
  --
  -- 然后，因为我们使用 `opts` 键（推荐），配置会在
  -- 插件加载后运行，如 `require(MODULE).setup(opts)`。

  { -- 显示待处理快捷键绑定的有用插件。
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
  },

  -- 注意：插件可以指定依赖项。
  --
  -- 依赖项也是适当的插件规范 - 任何
  -- 你在顶层为插件做的事情，你也可以为依赖项做。
  --
  -- 使用 `dependencies` 键指定特定插件的依赖项

  { -- 模糊查找器（文件、lsp 等）
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
  },

  -- LSP 插件
  {
    -- `lazydev` 为你的 Neovim 配置、运行时和插件配置 Lua LSP
    -- 用于 Neovim api 的补全、注释和签名
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- 当找到 `vim.uv` 词时加载 luvit 类型
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- 主 LSP 配置
    'neovim/nvim-lspconfig',
    dependencies = {
      -- 自动将 LSP 和相关工具安装到 Neovim 的 stdpath
      -- Mason 必须在其依赖项之前加载，所以我们需要在这里设置它。
      -- 注意：`opts = {}` 与调用 `require('mason').setup({})` 相同
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP 的有用状态更新。
      { 'j-hui/fidget.nvim', opts = {} },

      -- 允许 blink.cmp 提供的额外功能
      'saghen/blink.cmp',
    },
    config = function()
      -- 简要说明：**什么是 LSP？**
      --
      -- LSP 是一个你可能听说过但可能不理解其含义的首字母缩写。
      --
      -- LSP 代表语言服务器协议。它是一个帮助编辑器
      -- 和语言工具以标准化方式进行通信的协议。
      --
      -- 通常，你有一个"服务器"，它是为理解特定
      -- 语言而构建的某个工具（如 `gopls`、`lua_ls`、`rust_analyzer` 等）。这些语言服务器
      -- （有时称为 LSP 服务器，但这有点像 ATM 机）是独立的
      -- 进程，与某个"客户端"通信 - 在这种情况下，是 Neovim！
      --
      -- LSP 为 Neovim 提供以下功能：
      --  - 跳转到定义
      --  - 查找引用
      --  - 自动补全
      --  - 符号搜索
      --  - 以及更多！
      --
      -- 因此，语言服务器是必须与
      -- Neovim 分开安装的外部工具。这就是 `mason` 和相关插件发挥作用的地方。
      --
      -- 如果你想知道 lsp 与 treesitter 的区别，可以查看精彩
      -- 且优雅的帮助部分，`:help lsp-vs-treesitter`

      --  当 LSP 附加到特定缓冲区时，此函数会运行。
      --    也就是说，每次打开与
      --    lsp 关联的新文件时（例如，打开 `main.rs` 与 `rust_analyzer` 关联），此
      --    函数将执行以配置当前缓冲区
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- 注意：记住 Lua 是一种真正的编程语言，因此可以
          -- 定义小的辅助和实用函数，这样你就不必重复自己。
          --
          -- 在这种情况下，我们创建一个函数，让我们更容易定义特定于
          -- LSP 相关项的映射。它每次都为我们设置模式、缓冲区和描述。
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- 重命名光标下的变量。
          --  大多数语言服务器支持跨文件重命名等。
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- 执行代码操作，通常你的光标需要位于错误
          -- 或来自 LSP 的建议之上才能激活。
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- 查找光标下单词的引用。
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- 跳转到光标下单词的实现。
          --  当你的语言有声明类型而没有实际实现的方法时很有用。
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- 跳转到光标下单词的定义。
          --  这是变量首次声明的地方，或函数定义的地方等。
          --  要跳回，请按 <C-t>。
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- 警告：这不是跳转到定义，这是跳转到声明。
          --  例如，在 C 中，这将带你到头文件。
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- 模糊查找当前文档中的所有符号。
          --  符号是变量、函数、类型等。
          map('gO', require('telescope.builtin').lsp_document_symbols, '打开文档符号')

          -- 模糊查找当前工作区中的所有符号。
          --  类似于文档符号，只是在整个项目中搜索。
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, '打开工作区符号')

          -- 跳转到光标下单词的类型。
          --  当你不确定变量的类型并想查看
          --  其*类型*的定义，而不是它*定义*的位置时很有用。
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- 此函数解决了 neovim nightly（版本 0.11）和稳定版（版本 0.10）之间的差异
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer 某些 lsp 仅在特定文件中支持方法
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- 以下两个自动命令用于高亮显示
          -- 当光标在那里停留一会儿时，光标下单词的引用。
          --    有关何时执行此操作的信息，请参见 `:help CursorHold`
          --
          -- 当你移动光标时，高亮将被清除（第二个自动命令）。
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- 以下代码创建一个快捷键映射来切换代码中的
          -- 内联提示，如果你使用的语言服务器支持它们
          --
          -- 这可能是不需要的，因为它们会替换你的一些代码
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- 诊断配置
      -- 参见 :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP 服务器和客户端能够相互通信它们支持的功能。
      --  默认情况下，Neovim 不支持 LSP 规范中的所有内容。
      --  当你添加 blink.cmp、luasnip 等时，Neovim 现在具有*更多*功能。
      --  因此，我们使用 blink.cmp 创建新功能，然后将其广播给服务器。
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- 启用以下语言服务器
      --  你可以随意在此处添加/删除任何你想要的 LSP。它们将自动安装。
      --
      --  在以下表中添加任何其他覆盖配置。可用键是：
      --  - cmd (table): 覆盖用于启动服务器的默认命令
      --  - filetypes (table): 覆盖服务器的默认关联文件类型列表
      --  - capabilities (table): 覆盖功能中的字段。可用于禁用某些 LSP 功能。
      --  - settings (table): 覆盖初始化服务器时传递的默认设置。
      --        例如，要查看 `lua_ls` 的选项，你可以访问：https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... 等等。所有预配置的 LSP 列表，请参见 `:help lspconfig-all`
        --
        -- 某些语言（如 typescript）有完整的语言插件，可能很有用：
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- 但对于许多设置，LSP (`ts_ls`) 将正常工作
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- 你可以切换以下内容以忽略 Lua_LS 的嘈杂 `missing-fields` 警告
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- 确保上述服务器和工具已安装
      --
      -- 要检查已安装工具的当前状态和/或手动安装
      -- 其他工具，你可以运行
      --    :Mason
      --
      -- 你可以在此菜单中按 `g?` 获取帮助。
      --
      -- `mason` 必须更早设置：要配置其选项，请参见上面的
      -- `nvim-lspconfig` 的 `dependencies` 表。
      --
      -- 你可以在此处添加你希望 Mason 安装的其他工具
      -- 以便它们可以在 Neovim 中使用。
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- 用于格式化 Lua 代码
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- 显式设置为空表（Kickstart 通过 mason-tool-installer 填充安装）
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- 这仅处理显式传递的值的覆盖
            -- 通过上面的服务器配置。在禁用
            -- LSP 的某些功能时很有用（例如，关闭 ts_ls 的格式化）
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- 自动格式化
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 对于没有良好标准化编码风格的语言，禁用"保存时格式化 lsp_fallback"。
        -- 你可以在此处添加其他语言或为已禁用的语言重新启用它。
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform 也可以按顺序运行多个格式化器
        -- python = { "isort", "black" },
        --
        -- 你可以使用 'stop_after_first' 从列表中运行第一个可用的格式化器
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- 自动补全
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- 代码片段引擎
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- 构建步骤是代码片段中正则表达式支持所必需的。
          -- 此步骤在许多 Windows 环境中不受支持。
          -- 删除以下条件以在 Windows 上重新启用。
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` 包含各种预制的代码片段。
          --    有关各个语言/框架/插件代码片段的 README，请参见：
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default'（推荐）用于类似于内置补全的映射
        --   <c-y> 接受（[y]es）补全。
        --    如果你的 LSP 支持，这将自动导入。
        --    如果 LSP 发送了代码片段，这将展开代码片段。
        -- 'super-tab' 用于 tab 接受
        -- 'enter' 用于 enter 接受
        -- 'none' 表示无映射
        --
        -- 要理解为什么推荐 'default' 预设，
        -- 你需要阅读 `:help ins-completion`
        --
        -- 不，但说真的。请阅读 `:help ins-completion`，它真的很好！
        --
        -- 所有预设都有以下映射：
        -- <tab>/<s-tab>: 移动到代码片段展开的右侧/左侧
        -- <c-space>: 打开菜单或如果已打开则打开文档
        -- <c-n>/<c-p> 或 <up>/<down>: 选择下一个/上一个项目
        -- <c-e>: 隐藏菜单
        -- <c-k>: 切换签名帮助
        --
        -- 定义你自己的快捷键映射，请参见 :h blink-cmp-config-keymap
        preset = 'default',

        -- 有关更高级的 Luasnip 快捷键映射（例如选择选择节点、展开），请参见：
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono'（默认）用于 'Nerd Font Mono' 或 'normal' 用于 'Nerd Font'
        -- 调整间距以确保图标对齐
        nerd_font_variant = 'mono',
      },

      completion = {
        -- 默认情况下，你可以按 `<c-space>` 显示文档。
        -- 可选地，设置 `auto_show = true` 在延迟后显示文档。
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp 包含一个可选的、推荐的 rust 模糊匹配器，
      -- 启用时会自动下载预构建的二进制文件。
      --
      -- 默认情况下，我们使用 Lua 实现，但你可以通过 `'prefer_rust_with_warning'` 启用
      -- rust 实现
      --
      -- 更多信息，请参见 :h blink-cmp-config-fuzzy
      fuzzy = { implementation = 'lua' },

      -- 在输入函数参数时显示签名帮助窗口
      signature = { enabled = true },
    },
  },

  { -- 你可以轻松更改为不同的配色方案。
    -- 更改下面的配色方案插件名称，然后
    -- 将配置中的命令更改为该配色方案的名称。
    --
    -- 如果你想查看已安装的配色方案，可以使用 `:Telescope colorscheme`。
    'folke/tokyonight.nvim',
    priority = 1000, -- 确保在所有其他启动插件之前加载此插件。
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- 在注释中禁用斜体
        },
      }

      -- 在此处加载配色方案。
      -- 像许多其他主题一样，这个主题有不同的样式，你可以加载
      -- 任何其他样式，例如 'tokyonight-storm'、'tokyonight-moon' 或 'tokyonight-day'。
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  -- 在注释中高亮显示待办事项、注释等
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- 各种小型独立插件/模块的集合
    'echasnovski/mini.nvim',
    config = function()
      -- 更好的 Around/Inside 文本对象
      --
      -- 示例：
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- 添加/删除/替换周围内容（括号、引号等）
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- 简单易用的状态栏。
      --  如果你不喜欢它，可以删除此设置调用，
      --  并尝试其他状态栏插件
      local statusline = require 'mini.statusline'
      -- 如果你有 Nerd Font，将 use_icons 设置为 true
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- 你可以通过覆盖其默认行为来配置状态栏中的部分。
      -- 例如，这里我们将光标位置部分设置为 LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... 还有更多！
      --  查看：https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- 高亮、编辑和导航代码
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- 设置用于 opts 的主模块
    -- [[ 配置 Treesitter ]] 参见 `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- 自动安装未安装的语言
      auto_install = true,
      highlight = {
        enable = true,
        -- 某些语言依赖 vim 的正则表达式高亮系统（如 Ruby）来处理缩进规则。
        --  如果你遇到奇怪的缩进问题，请将语言添加到
        --  additional_vim_regex_highlighting 列表和禁用的缩进语言列表。
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- 还有其他 nvim-treesitter 模块，你可以使用它们来与
    -- nvim-treesitter 交互。你应该探索一些，看看什么让你感兴趣：
    --
    --    - 增量选择：已包含，参见 `:help nvim-treesitter-incremental-selection-mod`
    --    - 显示你当前的上下文：https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + 文本对象：https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- 以下注释仅在你下载了 kickstart 仓库时才有效，不仅仅是复制粘贴了
  -- init.lua。如果你想要这些文件，它们在仓库中，所以你可以下载它们并
  -- 将它们放在正确的位置。

  -- 注意：你的 Neovim 之旅的下一步：为 Kickstart 添加/配置其他插件
  --
  --  以下是我在 Kickstart 仓库中包含的一些示例插件。
  --  取消注释下面的任何行以启用它们（你需要重启 nvim）。
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- 添加 gitsigns 推荐快捷键映射

  -- 注意：下面的导入可以自动从 `lua/custom/plugins/*.lua` 添加你自己的插件、配置等
  --    这是模块化配置的最简单方法。
  --
  --  取消注释以下行并将你的插件添加到 `lua/custom/plugins/*.lua` 以开始使用。
  { import = 'custom.plugins' },
  --
  -- 有关加载、源和示例的其他信息，请参见 `:help lazy.nvim-🔌-plugin-spec`
  -- 或使用 telescope！
  -- 在普通模式下输入 `<space>sh` 然后写入 `lazy.nvim-plugin`
  -- 你可以使用 `<space>sr` 继续同一窗口，这会恢复上次的 telescope 搜索
}, {
  ui = {
    -- 如果你使用 Nerd Font：将图标设置为空表，将使用
    -- 默认的 lazy.nvim 定义的 Nerd Font 图标，否则定义一个 unicode 图标表
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'custom.config.keymaps'
require 'custom.config.autocmd'
-- 此行下方的内容称为 `modeline`。参见 `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
