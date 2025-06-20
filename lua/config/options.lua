-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 边输入边搜索
vim.o.incsearch = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 补全增强
vim.o.wildmenu = true

vim.g.python3_host_prog = "/path/to/conda/environment/bin/python"

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.wrap = true

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

-- 命令行高为1，提供足够的显示空间
vim.o.cmdheight = 1

vim.g.lazyvim_blink_main = false

vim.cmd([[
  cnoreabbrev <expr> ctt getcmdtype() == ':' && getcmdline() ==# 'ctt' ? 'CompetiTest' : 'ctt'
]])

vim.cmd([[
  cnoreabbrev <expr> crr getcmdtype() == ':' && getcmdline() ==# 'crr' ? 'CompetiTest run' : 'crr'
]])

vim.cmd([[
  cnoreabbrev <expr> crp getcmdtype() == ':' && getcmdline() ==# 'crp' ? 'CompetiTest receive persistently' : 'crp'
]])
