return {
    "stevearc/conform.nvim",
    opts = function()
        local plugin = require("lazy.core.config").plugins["conform.nvim"]
        local opts = {
            default_format_opts = {
                timeout_ms = 3000,
                async = false, -- not recommended to change
                quiet = false, -- not recommended to change
                lsp_format = "fallback", -- not recommended to change
            },

            formatters_by_ft = {
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
            },
            formatters = {
                injected = { options = { ignore_errors = true } },
                clang_format = {
                    prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}" },
                },
                prettier = {
                    -- Add Prettier configuration options here
                    prepend_args = { "--tab-width", "4" },
                },
            },
        }
        return opts
    end,
}
