if true then
    return {}
end
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        opts.routes = {
            {
                filter = { event = "msg_show", kind = { "" } }, -- 捕获所有消息
                view = "notify", -- 用通知弹窗显示
            },
        }
        return opts
    end,
}
