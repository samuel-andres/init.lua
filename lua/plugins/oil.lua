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
                    ["<C-s>"] = "actions.select_vsplit",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
            }
        end,
    },
}
