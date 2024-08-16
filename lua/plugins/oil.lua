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
                use_default_keymaps = false,
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["gs"] = "actions.change_sort",
                    ["g."] = "actions.toggle_hidden",
                },
            }
        end,
    },
}
