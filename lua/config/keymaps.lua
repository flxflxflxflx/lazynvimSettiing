-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 将 <leader>f 映射为格式化命令，并绑定到当前缓冲区
local buf = vim.api.nvim_get_current_buf()
vim.api.nvim_buf_set_keymap(buf, "n", "<leader>p", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
