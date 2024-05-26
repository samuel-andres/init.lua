return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        event = { "VimEnter */*,.*", "BufNew */*,.*" },
        config = function()
            require("oil").setup()
        end,
    },
}
