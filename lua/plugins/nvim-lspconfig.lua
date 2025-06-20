-- LSP keymaps
return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.inlay_hints = {
            enabled = true,
            exclude = { "cpp" }, -- filetypes for which you don't want to enable inlay hints
        }

        return opts
    end,
}
