return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    completion = {
      accept = {
        auto_brackets = { enabled = false },
      },
    },
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
