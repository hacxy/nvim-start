-- [[ 基本自动命令 ]]
--  参见 `:help lua-guide-autocommands`

-- 在拉取（复制）文本时高亮显示
--  在普通模式下使用 `yap` 试试
--  参见 `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = '拉取（复制）文本时高亮显示',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- 确保折叠功能正常工作
-- 如果 treesitter 可用，优先使用 treesitter 折叠（更智能）
vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
  desc = '设置折叠方法',
  group = vim.api.nvim_create_augroup('kickstart-folding', { clear = true }),
  callback = function()
    -- 检查 treesitter 是否可用且已加载
    local ok, _ = pcall(require, 'nvim-treesitter.configs')
    if ok and vim.treesitter then
      -- 尝试使用 treesitter 折叠
      local bufnr = vim.api.nvim_get_current_buf()
      local has_parser = pcall(vim.treesitter.get_parser, bufnr)
      if has_parser then
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        return
      end
    end
    -- 回退到基于缩进的折叠
    vim.wo.foldmethod = 'indent'
  end,
})
