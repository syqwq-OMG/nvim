local is_on_mac = false
if vim.fn.has("mac") then
    is_on_mac = true
end

local CLANG_FORMAT_ARGS = { "--style=file:/home/syqwq/.config/nvim/lua/config/.clang-format" }
if is_on_mac then
    CLANG_FORMAT_ARGS = { "--style=file:/Users/syqwq-omg/.config/nvim/lua/config/.clang-format" }
end

return {
    "stevearc/conform.nvim",
    opts = function(_, opts)
        opts.formatters_by_ft = {
            cpp = { "clang_format" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
        }
        opts.formatters = {
            injected = { options = { ignore_errors = true } },
            clang_format = {
                -- prepend_args = { "--style=file:/Users/syqwq-omg/.config/nvim/lua/config/.clang-format" },
                -- prepend_args = { "--style=file:/home/syqwq/.config/nvim/lua/config/.clang-format" },
                prepend_args = CLANG_FORMAT_ARGS,
            },
            prettier = {
                -- Add Prettier configuration options here
                -- prepend_args = { "--tab-width", "4" },
                prepend_args = { "--tab-width", "2" },
            },
        }
        return opts
    end,
}
