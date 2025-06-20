-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "css", "html" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

-- Disable format on save for C++ files under oi dir
-- local no_format_dir = "/home/syqwq/workspace/oi"
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "cpp",
--     callback = function()
--         local fullpath = vim.fn.expand("%:p")
--         if fullpath:find(no_format_dir, 1, true) then
--             -- Disable LazyVim’s autoformat for this buffer
--             vim.b.autoformat = false
--         end
--         -- vim.b.autoformat = false -- Disable autoformat for C++
--     end,
-- })
--
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- set the title for competitve programming
-- local use_split = true
local use_split = false
if not use_split then
    return
end
---- 在Neovim配置中先定义高亮组（放在autocmd之前）
vim.cmd([[
  highlight! CompetiTestTitle guibg=NONE guifg=#88C0D0
  highlight! link WinBar CompetiTestTitle
  highlight! link StatusLine CompetiTestTitle
]])

vim.api.nvim_create_autocmd({ "BufAdd", "BufWinEnter" }, {
    pattern = "*",
    callback = function(args)
        vim.schedule(function()
            local buf = args.buf
            if vim.api.nvim_buf_is_valid(buf) then
                local success, title = pcall(vim.api.nvim_buf_get_var, buf, "competitest_title")
                if success and title ~= "" then
                    local wins = vim.fn.win_findbuf(buf)
                    for _, win in ipairs(wins) do
                        if vim.api.nvim_win_is_valid(win) then
                            -- 推荐使用winbar（更现代的方式）
                            vim.wo[win].winbar = "%#CompetiTestTitle#%{getbufvar(bufnr(), 'competitest_title', '')}%*"

                            -- 或者使用statusline（旧版兼容）
                            -- vim.wo[win].statusline = "%#CompetiTestTitle#%{getbufvar(bufnr(), 'competitest_title', '')}%*"
                        end
                    end
                end
            end
        end)
    end,
})
