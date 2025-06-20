return {
    "folke/snacks.nvim",
    opts = function(_, opts)
        opts.picker = {
            hidden = true,
            ignore = true,
        }
        return opts
    end,
}
