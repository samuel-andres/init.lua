return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        init = function()
            require("tokyonight").setup {
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            }
            vim.cmd.colorscheme "tokyonight-night"
            vim.cmd.hi "Comment gui=none"
        end,
    },
}
