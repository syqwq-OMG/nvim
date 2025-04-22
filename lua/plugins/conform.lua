return {
    "stevearc/conform.nvim",
    opts = function()
        local plugin = require("lazy.core.config").plugins["conform.nvim"]
        local opts = {
            formatters_by_ft = {
                cpp = { "clang_format" },
            },
            formatters = {
                clang_format = {
                    prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}" },
                },
            },
        }
        return opts
    end,
}
