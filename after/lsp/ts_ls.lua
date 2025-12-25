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
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
    -- `vim.lsp.buf.code_action()` if specified in `context.only`.
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
      local source_actions = vim.tbl_filter(function(action)
        return vim.startswith(action, 'source.')
      end, client.server_capabilities.codeActionProvider.codeActionKinds)

      vim.lsp.buf.code_action({
        context = {
          only = source_actions,
          diagnostics = {},
        },
      })
    end, {})

    -- Go to source definition command
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptGoToSourceDefinition', function()
      local win = vim.api.nvim_get_current_win()
      local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
      client:exec_cmd({
        command = '_typescript.goToSourceDefinition',
        title = 'Go to source definition',
        arguments = { params.textDocument.uri, params.position },
      }, { bufnr = bufnr }, function(err, result)
        if err then
          vim.notify('Go to source definition failed: ' .. err.message, vim.log.levels.ERROR)
          return
        end
        if not result or vim.tbl_isempty(result) then
          vim.notify('No source definition found', vim.log.levels.INFO)
          return
        end
        vim.lsp.util.show_document(result[1], client.offset_encoding, { focus = true })
      end)
    end, { desc = 'Go to source definition' })
  end,
}
