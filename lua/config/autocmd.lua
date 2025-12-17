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

-- Add IceLoad event
vim.api.nvim_create_autocmd("User", {
    pattern = "IceAfter colorscheme",
    callback = function()
        local function should_trigger()
            return vim.bo.filetype ~= "dashboard" and vim.api.nvim_buf_get_name(0) ~= ""
        end

        local function trigger()
            vim.api.nvim_exec_autocmds("User", { pattern = "HacxyLoad" })
        end

        if should_trigger() then
            trigger()
            return
        end

        local ice_load
        ice_load = vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                if should_trigger() then
                    trigger()
                    vim.api.nvim_del_autocmd(ice_load)
                end
            end,
        })
    end,
})
