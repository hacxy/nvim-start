return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = function()
    -- biome 支持的文件类型
    -- https://biomejs.dev/internals/language-support/
    local biome_supported = {
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
    }

    local formatters_by_ft = {
      lua = { 'stylua' },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
    }

    -- 为 biome 支持的文件类型添加 biome-check 作为首选 formatter
    for _, ft in ipairs(biome_supported) do
      formatters_by_ft[ft] = { 'biome-check', 'prettierd', 'prettier', stop_after_first = true }
    end

    return {
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters = {
        -- biome-check: 有 biome.json 时才启用
        ['biome-check'] = {
          require_cwd = true,
        },
        -- prettier: 有配置文件时才启用
        prettier = {
          require_cwd = true,
        },
        prettierd = {
          require_cwd = true,
        },
      },
    }
  end,
}
