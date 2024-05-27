-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Close buffer with leader x
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")

-- Diagnostic keymaps
vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    { desc = "Go to previous [D]iagnostic message" }
)
vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    { desc = "Go to next [D]iagnostic message" }
)
vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Show diagnostic [E]rror messages" }
)
vim.keymap.set(
    "n",
    "<leader>q",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostic [Q]uickfix list" }
)
