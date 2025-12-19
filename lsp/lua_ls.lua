return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        -- Set callSnippet to "Replace" or "None" to control parentheses insertion.
        -- "Replace" will insert the snippet with parameters but without an extra pair of empty parentheses.
        -- "None" will just insert the function name.
        -- callSnippet = "Replace", -- or "None"
      },
    },
  },
}
