return {
    { -- Fuzzy Finder (files, lsp, etc)
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
            { "nvim-telescope/telescope-ui-select.nvim" },

            -- Useful for getting pretty icons, requires a Nerd Font.
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "git_signs")
            pcall(require("telescope").load_extension, "yank_history")

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
            vim.keymap.set(
                "n",
                "<leader>sy",
                "<CMD>Telescope yank_history<CR>",
                { desc = "[S]earch [Y]ank history" }
            )

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown {
                        winblend = 10,
                        previewer = false,
                    }
                )
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end, { desc = "[S]earch [/] in Open Files" })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end, { desc = "[S]earch [N]eovim files" })
            local harpoon = require "harpoon"
            harpoon:setup {}

            -- [[ Configure Telescope ]]
            require("telescope").setup {
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<c-q>"] = "delete_buffer",
                            },
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            }
            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                local make_finder = function()
                    local paths = {}
                    for _, item in ipairs(harpoon_files.items) do
                        table.insert(paths, item.value)
                    end

                    return require("telescope.finders").new_table {
                        results = paths,
                    }
                end

                require("telescope.pickers")
                    .new({}, {
                        prompt_title = "Harpoon",
                        finder = make_finder(),
                        previewer = conf.file_previewer {},
                        sorter = conf.generic_sorter {},
                        attach_mappings = function(prompt_buffer_number, map)
                            map("i", "<C-q>", function()
                                local state = require "telescope.actions.state"
                                local selected_entry =
                                    state.get_selected_entry()
                                local current_picker =
                                    state.get_current_picker(
                                        prompt_buffer_number
                                    )
                                harpoon:list():remove_at(selected_entry.index)
                                current_picker:refresh(make_finder())
                            end)
                            return true
                        end,
                    })
                    :find()
            end

            vim.keymap.set("n", "<C-e>", function()
                toggle_telescope(harpoon:list())
            end, { desc = "Open harpoon window" })
        end,
    },
    {
        "radyz/telescope-gitsigns",
    },
    {
        "gbprod/yanky.nvim",
        opts = {
            highlight = {
                on_put = false,
                on_yank = false,
            },
            system_clipboard = {
                sync_with_ring = true,
            },
        },
    },
}
