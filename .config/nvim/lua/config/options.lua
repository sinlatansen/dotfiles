-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- 字符编码
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- 替换实时预览
opt.inccommand = "split"

-- 缩进
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- 退格键
opt.backspace = "indent,eol,start"

opt.showcmd = true

opt.backup = false

-- 设置保留可视行数
opt.scrolloff = 10

-- 搜索忽略大小写
opt.ignorecase = true

opt.splitbelow = true
opt.splitright = true

opt.winbar = "%=%m %f"
