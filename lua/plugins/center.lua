return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        require("no-neck-pain").setup {
            vim.keymap.set(
                "n",
                "<leader>cc",
                "<CMD>NoNeckPain<CR>",
                { desc = "Toggle center buffer (horizontally)" }
            ),
        }
    end,
}
