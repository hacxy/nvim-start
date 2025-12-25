local M = {}
function M.has_config(ctx)
  vim.fn.system({ 'prettier', '--find-config-path', ctx.filename })
  return vim.v.shell_error == 0
end

local supported = {
  'css',
  'graphql',
  'handlebars',
  'html',
  'javascript',
  'javascriptreact',
  'json',
  'jsonc',
  'less',
  'markdown',
  'markdown.mdx',
  'scss',
  'typescript',
  'typescriptreact',
  'vue',
  'yaml',
}

function M.has_parser(ctx)
  local ft = vim.bo[ctx.buf].filetype --[[@as string]]
  -- default filetypes are always supported
  if vim.tbl_contains(supported, ft) then
    return true
  end
  -- otherwise, check if a parser can be inferred
  local ret = vim.fn.system({ 'prettier', '--file-info', ctx.filename })
  ---@type boolean, string?
  local ok, parser = pcall(function()
    return vim.fn.json_decode(ret).inferredParser
  end)
  return ok and parser and parser ~= vim.NIL
end

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- javascript = { 'prettier', stop_after_first = true, lsp_format = 'never' },
      -- typescript = { 'prettier', stop_after_first = true, lsp_format = 'never' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
    format_after_save = {
      lsp_format = 'never',
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'never',
    },
    -- formatters = {
    --   prettier = {
    --     condition = function(_, ctx)
    --       print(M.has_config(ctx))
    --       return false
    --     end,
    --   },
    -- },
  },
  -- enabled = false,
}
