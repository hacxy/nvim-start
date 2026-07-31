local vscode_settings = require('utils.vscode_settings')

local vscodeSettings = vscode_settings.read_vscode_settings()

local eslintRulesCustomizations = {}

if vscodeSettings ~= false then
  eslintRulesCustomizations = vscodeSettings.eslintRulesCustomizations
end

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
    rulesCustomizations = eslintRulesCustomizations,
  },

  on_attach = function(client, bufnr)
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

    -- eslint 只用于 lint 报错，格式化交给 biome/prettier
    -- 如需手动修复，执行 :LspEslintFixAll
  end,
}
