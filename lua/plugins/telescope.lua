return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            { "radyz/telescope-gitsigns" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "git_signs")

            local builtin = require "telescope.builtin"
            vim.keymap.set(
                "n",
                "<leader>hh",
                builtin.help_tags,
                { desc = "[S]earch [H]elp" }
            )
            vim.keymap.set(
                "n",
                "<leader>sk",
                builtin.keymaps,
                { desc = "[S]earch [K]eymaps" }
            )
            vim.keymap.set(
                "n",
                "<leader>sf",
                builtin.find_files,
                { desc = "[S]earch [F]iles" }
            )
            vim.keymap.set(
                "n",
                "<leader>ss",
                builtin.builtin,
                { desc = "[S]earch [S]elect Telescope" }
            )
            vim.keymap.set(
                "n",
                "<leader>sw",
                builtin.grep_string,
                { desc = "[S]earch current [W]ord" }
            )
            vim.keymap.set(
                "n",
                "<leader>sg",
                builtin.live_grep,
                { desc = "[S]earch by [G]rep" }
            )
            vim.keymap.set(
                "n",
                "<leader>sd",
                builtin.diagnostics,
                { desc = "[S]earch [D]iagnostics" }
            )
            vim.keymap.set(
                "n",
                "<leader>sr",
                builtin.resume,
                { desc = "[S]earch [R]esume" }
            )
            vim.keymap.set(
                "n",
                "<leader>s.",
                builtin.oldfiles,
                { desc = '[S]earch Recent Files ("." for repeat)' }
            )
            vim.keymap.set(
                "n",
                "<leader><leader>",
                builtin.buffers,
                { desc = "[ ] Find existing buffers" }
            )
            vim.keymap.set(
                "n",
                "<leader>sc",
                builtin.git_status,
                { desc = "[S]earch [G]it Status" }
            )
            vim.keymap.set(
                "n",
                "<leader>sh",
                "<CMD>Telescope git_signs<CR>",
                { desc = "[S]earch [H]unks" }
            )
            vim.keymap.set(
                "n",
                "<leader>sz",
                builtin.current_buffer_fuzzy_find,
                { desc = "[S]earch on [C]urrent buffer" }
            )
            vim.keymap.set(
                "n",
                "<leader>sp",
                builtin.registers,
                { desc = "[S]earch [P]aste registers" }
            )

            require("telescope").setup {}
        end,
    },
}
