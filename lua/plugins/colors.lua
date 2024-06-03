return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {},
        init = function()
            require("gruvbox").setup {
                transparent_mode = false,
            }
            vim.cmd "colorscheme gruvbox"
        end,
    },
}
