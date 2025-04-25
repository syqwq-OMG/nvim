-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local del = vim.keymap.del
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- del("n", "<c-k>")
map("n", "<C-d>", "10j", opt)
map("n", "<C-u>", "10k", opt)
--
map("i", "<C-[>", "<Esc>", opt)
map("v", "<C-[>", "<Esc>", opt)
map("t", "<C-[>", "<Esc>", opt)

-- map("i", "<C-p>", "<Esc>", opt)
-- map("n", "<C-p>", "<Esc>", opt)
-- map("v", "<C-p>", "<Esc>", opt)
-- map("t", "<C-p>", "<Esc>", opt)
--
-- map("n", "<CR>", "o<Esc>", opt)

-- map("n", "<S-CR>", "O<Esc>", opt)

-- map("n", "<C-S-Left>", ":vertical resize -2<CR>", opt)
-- map("n", "<C-S-Right>", ":vertical resize +2<CR>", opt)

-- map("i", "<C-;>", "<Esc>", opt)
-- map("v", "<C-;>", "<Esc>", opt)
-- map("t", "<C-;>", "<Esc>", opt)
