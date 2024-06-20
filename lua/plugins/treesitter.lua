return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "vim",
                "vimdoc",
                "lua",
                "luadoc",
                "diff",
                "html",
                "markdown",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "python",
                "c",
                "bash",
                "dockerfile",
                "yaml",
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                disable = { "latex" },
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            -- [[ Configure Treesitter ]]

            -- Prefer git instead of curl in order to improve connectivity in some environments
            require("nvim-treesitter.install").prefer_git = true
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
