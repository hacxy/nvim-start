-- 按ctrl + s 保存并回到默认模式
vim.keymap.set('i', '<C-s>', '<cmd>w<CR><esc>', { desc = '保存并回到默认模式' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR><esc>', { desc = '保存并回到默认模式' })

-- 按 <leader>q 退出编辑器
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '退出编辑器' })
