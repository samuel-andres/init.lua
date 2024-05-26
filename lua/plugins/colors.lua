return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        init = function()
            require("tokyonight").setup {
                transparent = true,
            }
            vim.cmd.colorscheme "tokyonight-night"
            vim.cmd.hi "Comment gui=none"
        end,
    },
}
