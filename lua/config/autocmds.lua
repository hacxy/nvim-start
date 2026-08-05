-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable spell check for markdown
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("disable_spell", { clear = true }),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- snacks explorer 的 git 状态刷新依赖 fs_event 监听（macOS 上事件经常丢失），
-- 且内部有 15 分钟缓存，导致 git 状态不更新、必须重启 nvim 才能恢复。
-- 在焦点恢复 / 保存文件 / 会话恢复时，强制重置 git 缓存并刷新 explorer。
vim.api.nvim_create_autocmd({ "FocusGained", "BufWritePost", "VimResume" }, {
  group = vim.api.nvim_create_augroup("snacks_explorer_git_refresh", { clear = true }),
  callback = function()
    local ok, Snacks = pcall(require, "snacks")
    if not ok then
      return
    end
    local pickers = Snacks.picker.get({ source = "explorer", tab = false })
    for _, picker in ipairs(pickers) do
      if picker and not picker.closed then
        require("snacks.explorer.git").refresh(picker:cwd())
      end
    end
    require("snacks.explorer.watch").refresh()
  end,
})
