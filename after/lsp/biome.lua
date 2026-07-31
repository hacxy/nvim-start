return {
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'jsonc',
    'css',
    'scss',
    'astro',
    'svelte',
    'vue',
  },
  root_markers = { 'biome.json', 'biome.jsonc' },
  on_attach = function(client, bufnr)
    -- 保存时自动执行 source.fixAll.biome
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('BiomeFixAll' .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = {
            only = { 'source.fixAll.biome' },
            diagnostics = {},
          },
          apply = true,
        })
      end,
    })
  end,
}
