local M = require('utils.prettier')
return {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
    'html',
    'markdown',
    'json',
    'jsonc',
    'yaml',
    'toml',
    'xml',
    'gql',
    'graphql',
    'astro',
    'svelte',
    'css',
    'less',
    'scss',
    'pcss',
    'postcss',
  },

  settings = {
    -- Silent the stylistic rules in your IDE, but still auto fix them
    rulesCustomizations = {
      { rule = 'style/*', severity = 'on', fixable = true },
      { rule = 'format/*', severity = 'on', fixable = true },
      { rule = '*-indent', severity = 'on', fixable = true },
      { rule = '*-spacing', severity = 'on', fixable = true },
      { rule = '*-spaces', severity = 'on', fixable = true },
      { rule = '*-order', severity = 'on', fixable = true },
      { rule = '*-dangle', severity = 'on', fixable = true },
      { rule = '*-newline', severity = 'on', fixable = true },
      { rule = '*quotes', severity = 'on', fixable = true },
      { rule = '*semi', severity = 'on', fixable = true },
    },
  },

  on_attach = function(client, bufnr)
    local path = vim.fn.expand('%:p')

    vim.api.nvim_buf_create_user_command(bufnr, 'LspEslintFixAll', function()
      client:request_sync('workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, nil, bufnr)
    end, {})

    if not M.has_config(path) then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'LspEslintFixAll',
      })
    end
  end,
}
