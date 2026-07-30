# Neovim Configuration

A custom Neovim configuration built from scratch, migrated from LazyVim. Designed for a clean, minimal, and efficient editing experience with a focus on web development (TypeScript, Vue, CSS/SCSS) and Lua.

## Preview

> Add a screenshot or GIF here

## Features

- **Plugin Management** — [lazy.nvim](https://github.com/folke/lazy.nvim) with auto-bootstrap
- **Colorscheme** — [Catppuccin](https://github.com/catppuccin/nvim) with transparent background
- **Dashboard** — Custom start screen via [Snacks.nvim](https://github.com/folke/snacks.nvim)
- **LSP** — Language servers managed by Mason (ts_ls, lua_ls, eslint, html, stylelint)
- **Completion** — [blink.cmp](https://github.com/saghen/blink.cmp) with LSP capabilities
- **Formatting** — [conform.nvim](https://github.com/stevearc/conform.nvim) with Prettier & StyLua
- **Linting** — [nvim-lint](https://github.com/mfussenegger/nvim-lint) integration
- **Syntax Highlighting** — Treesitter with support for 25+ languages
- **Git Integration** — [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) + lazygit terminal
- **File Explorer** — [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- **Fuzzy Finding** — Snacks picker for files, grep, git files, and more
- **Terminal** — Integrated terminal with Snacks
- **Status Line** — [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- **Notifications** — [noice.nvim](https://github.com/folke/noice.nvim) for better UI messages
- **Auto-pairs** — [mini.pairs](https://github.com/echasnovski/mini.pairs)
- **Smart Folding** — [origami.nvim](https://github.com/chrisgrieser/nvim-origami)
- **IM Select** — Automatic input method switching on macOS
- **VS Code Settings Sync** — Reads VS Code settings for Prettier configuration

## Requirements

- **Neovim** >= 0.11
- **Nerd Font** (for icons)
- **Git**
- **Node.js** (for Mason packages)
- **ripgrep** (for grep/search)
- **fd** (for file finding)
- **tree-sitter-cli** (for Treesitter parser compilation)
- **lazygit** (optional, for git UI)
- **Kitty** terminal (required for image preview via image.nvim; use `iterm2` backend if on iTerm2)
- **luarocks** + **ImageMagick** (optional, for image.nvim image preview)
- **im-select** (optional, for automatic input method switching on macOS)

### Quick Install (macOS)

```bash
brew install neovim git node ripgrep fd tree-sitter luarocks imagemagick lazygit
brew install --cask font-jetbrains-mono-nerd-font
# Optional: im-select for input method switching
# brew install im-select
```

## Installation

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/hacxy/nvim.git ~/.config/nvim

# Launch Neovim — plugins will auto-install
nvim
```

## Keybindings

> Leader key: `Space`

### General

| Key | Mode | Description |
| ----- | ------ | ------------- |
| `<Esc>` | Normal | Clear search highlight |
| `<C-s>` | Normal/Insert | Save file |
| `<leader>qq` | Normal | Quit editor |
| `<D-z>` | Normal/Insert | Undo (macOS) |

### Window Navigation

| Key | Mode | Description |
| ----- | ------ | ------------- |
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to lower window |
| `<C-k>` | Normal | Move to upper window |
| `<C-l>` | Normal | Move to right window |

### Snacks Picker

| Key | Mode | Description |
| ----- | ------ | ------------- |
| `<leader>,` | Normal | Buffers |
| `<leader>/` | Normal | Grep |
| `<leader>:` | Normal | Command History |
| `<leader>ff` | Normal | Find Files (Root Dir) |
| `<leader>fg` | Normal | Find Git Files |
| `<leader>fp` | Normal | Projects |
| `<leader>fr` | Normal | Recent Files |
| `<leader>fc` | Normal | Find Config File |

### Git & Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gg` | Normal | Open lazygit |
| `<C-_>` | Normal | Toggle terminal |

### LSP

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |

### Buffer

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>bd` | Normal | Delete buffer |

## Project Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── lazy-lock.json            # Plugin lockfile
├── after/
│   ├── ftplugin/             # Filetype-specific settings
│   │   └── markdown.lua
│   └── lsp/                  # Per-server LSP configuration
│       ├── eslint.lua
│       ├── lua_ls.lua
│       ├── stylelint_lsp.lua
│       └── ts_ls.lua
└── lua/
    ├── config/
    │   ├── autocmd.lua       # Autocommands
    │   ├── basic.lua         # Editor options
    │   ├── keymaps.lua       # Key mappings
    │   ├── lazy.lua          # Plugin manager setup
    │   └── lsp.lua           # LSP attach & diagnostics
    ├── plugins/              # Plugin specifications
    │   ├── blink.lua         # Completion
    │   ├── colorscheme.lua   # Catppuccin
    │   ├── conform.lua       # Formatting
    │   ├── gitsigns.lua      # Git signs
    │   ├── im-select.lua     # Input method switching
    │   ├── image.lua         # Image preview
    │   ├── lazydev.lua       # Lua development
    │   ├── lspconfig.lua     # LSP configuration
    │   ├── lualine.lua       # Status line
    │   ├── mason.lua         # LSP/formatter installer
    │   ├── mini.pairs.lua    # Auto-pairing
    │   ├── neo-tree.lua      # File explorer
    │   ├── noice.lua         # UI messages
    │   ├── nvim-lint.lua     # Linting
    │   ├── origami.lua       # Folding
    │   ├── snacks.lua        # Dashboard, picker, terminal
    │   ├── treesitter.lua    # Syntax highlighting
    │   ├── ts-comments.lua   # Commenting
    │   └── which-key.lua     # Keybinding hints
    └── utils/
        ├── prettier.lua      # Prettier utilities
        └── vscode_settings.lua # VS Code settings reader
```

## Installed LSP Servers & Tools

Managed via [Mason](https://github.com/williamboman/mason.nvim):

| Tool | Purpose |
| ------ | --------- |
| `ts_ls` | TypeScript / JavaScript |
| `lua_ls` | Lua |
| `html` | HTML |
| `eslint` | JavaScript / TypeScript linting |
| `stylelint_lsp` | CSS / SCSS linting |
| `prettier` / `prettierd` | Code formatting |
| `stylua` | Lua formatting |

## Treesitter Languages

Bash, CSS, Diff, Fish, HTML, JavaScript, JSON, Lua, Markdown, Python, SCSS, TOML, TSX, TypeScript, Typst, Vue, XML, and more (see `lua/plugins/treesitter.lua`).

## License

MIT
