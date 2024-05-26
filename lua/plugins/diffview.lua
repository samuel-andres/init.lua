return {
    {
        "sindrets/diffview.nvim",
        lazy = false,
        config = function()
            require("diffview").setup()
        end,
    },
}
