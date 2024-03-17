-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 删除字符并放入黑洞寄存器，避免影响剪贴板
keymap.set("n", "x", '"_x')

-- 全选文本
keymap.set("n", "<C-a>", "gg<S-v>G")

-- 在普通模式和插入模式之间快速切换
keymap.set("i", "jj", "<ESC>", opts) -- 在插入模式下按 jk 返回普通模式
