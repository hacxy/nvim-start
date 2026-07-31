-- 后台定时检测文件外部变更，无需聚焦即可自动更新 buffer
vim.fn.timer_start(1000, function()
  if vim.fn.mode() == "n" then
    vim.cmd "checktime"
  end
end, { ["repeat"] = -1 })

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

-- 文件删除后自动关闭对应的 buffer
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained' }, {
  desc = '检测文件是否被删除，自动关闭对应 buffer',
  group = vim.api.nvim_create_augroup('auto-close-deleted-file', { clear = true }),
  callback = function(event)
    local buf = event.buf
    -- 跳过特殊 buffer
    if vim.bo[buf].buftype ~= '' then
      return
    end

    local file = vim.api.nvim_buf_get_name(buf)
    if file == '' then
      return
    end

    -- 检查文件是否存在
    if vim.fn.filereadable(file) == 0 then
      -- 延迟删除，避免与其他 BufEnter 回调冲突（如 image.nvim）
      vim.schedule(function()
        -- 再次检查 buffer 是否有效
        if vim.api.nvim_buf_is_valid(buf) then
          vim.notify('文件已被删除: ' .. vim.fn.fnamemodify(file, ':t'), vim.log.levels.WARN)
          vim.cmd('bwipeout! ' .. buf)
        end
      end)
    end
  end,
})
