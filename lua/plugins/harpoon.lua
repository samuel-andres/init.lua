return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
        local harpoon = require "harpoon"
        harpoon.setup {}
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add current buffer to Harpoon list" })
        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "Jump to item 1 in Harpoon list" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "Jump to item 2 in Harpoon list" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "Jump to item 3 in Harpoon list" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "Jump to item 4 in Harpoon list" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", function()
            harpoon:list():prev { ui_nav_wrap = true }
        end, { desc = "Jump to previous buffer in Harpoon list" })
        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():next { ui_nav_wrap = true }
        end, { desc = "Jump to next buffer in Harpoon list" })
    end,
}
