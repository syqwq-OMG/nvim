return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
        -- opts.transparent = true
        opts.transparent = false
        return opts
    end,
}
