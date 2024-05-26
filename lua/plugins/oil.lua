return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        event = { "VimEnter */*,.*", "BufNew */*,.*" },
        config = function()
            vim.keymap.set(
                "n",
                "-",
                "<CMD>Oil --float<CR>",
                { desc = "Open parent directory" }
            )
            require("oil").setup()
        end,
    },
}
