return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        event = { "VimEnter */*,.*", "BufNew */*,.*" },
        config = function()
            vim.keymap.set(
                "n",
                "-",
                "<CMD>Oil<CR>",
                { desc = "Open parent directory" }
            )
            require("oil").setup {
                default_file_explorer = true,
            }
        end,
    },
}
