# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## ⚡️ 前置依赖

### 必需

| 工具 | 说明 | 安装命令 (macOS) |
| ------ | ------ | ----------------- |
| **Neovim** >= 0.11.2 | 编辑器 (需要 LuaJIT 构建) | `brew install neovim` |
| **Git** >= 2.19.0 | 版本控制 | `brew install git` |
| **Nerd Font** | 图标显示 (可选但推荐) | [nerdfonts.com](https://www.nerdfonts.com/font-downloads) |

### 推荐工具

| 工具 | 说明 | 安装命令 |
| ------ | ------ | --------- |
| **lazygit** | Git TUI 界面 | `brew install lazygit` |
| **fzf** | 模糊搜索 | `brew install fzf` |
| **ripgrep** (rg) | 全局文本搜索 | `brew install ripgrep` |
| **fd** | 快速文件查找 | `brew install fd` |
| **curl** | HTTP 请求 (blink.cmp 需要) | `brew install curl` |
| **tree-sitter-cli** | Treesitter 语法解析 | `brew install tree-sitter-cli` |
| **im-select** | macOS 输入法自动切换 | `brew install im-select` |

### 语言工具 (可选)

| 工具 | 说明 | 安装命令 |
| ------ | ------ | --------- |
| **stylua** | Lua 格式化 | `brew install stylua` |
| **shfmt** | Shell 格式化 | `brew install shfmt` |
| **biome** | JS/TS/JSON 格式化 + Lint | `brew install biome` |
| **prettier** | 多语言格式化 | `npm install -g prettier` |
| **eslint** | JS/TS Lint | `npm install -g eslint` |
| **lua-language-server** | Lua LSP | `brew install lua-language-server` |

## 🚀 一键安装所有依赖 (macOS)

```bash
# 必需
brew install neovim git curl

# 推荐工具
brew install lazygit fzf ripgrep fd tree-sitter-cli im-select

# 语言工具 (按需安装)
brew install stylua shfmt biome
npm install -g prettier eslint
```

## 📦 安装配置

```bash
# 备份现有配置
mv ~/.config/nvim{,.bak}

# 克隆配置
git clone <your-repo-url> ~/.config/nvim

# 启动 Neovim (首次启动会自动安装插件)
nvim
```

首次启动后运行 `:LazyHealth` 检查是否一切正常。

## 📂 目录结构

```text
~/.config/nvim
├── init.lua              # 入口文件
├── stylua.toml           # Lua 格式化配置
├── lazyvim.json          # LazyVim 状态文件
└── lua
    ├── config
    │   ├── autocmds.lua  # 自动命令
    │   ├── keymaps.lua   # 快捷键
    │   ├── lazy.lua      # lazy.nvim 配置
    │   └── options.lua   # 选项设置
    └── plugins
        ├── example.lua   # 示例插件 (默认禁用)
        └── im-select.lua # macOS 输入法切换
```

## ⚙️ 自定义配置

- `lua/config/options.lua` - 修改编辑器选项
- `lua/config/keymaps.lua` - 添加自定义快捷键
- `lua/config/autocmds.lua` - 添加自动命令
- `lua/plugins/` - 添加/覆盖插件配置
- 运行 `:LazyExtras` 启用额外功能 (如 TypeScript、Biome 等)

## 📚 参考

- [LazyVim 官方文档](https://lazyvim.github.io)
- [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes) (免费电子书)
- [LazyVim Cheatsheet](https://lazyvim.github.io/keymaps)
