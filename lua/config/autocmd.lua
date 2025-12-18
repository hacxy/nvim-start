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

