-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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

-- custom tmux navigator mappings
vim.keymap.set(
    "n",
    "<C-h>",
    "<cmd>TmuxNavigateLeft<CR>",
    { desc = "Tmux navigate left" }
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<cmd>TmuxNavigateDown<CR>",
    { desc = "Tmux navigate down" }
)
vim.keymap.set(
    "n",
    "<C-k>",
    "<cmd>TmuxNavigateUp<CR>",
    { desc = "Tmux navigate up" }
)
vim.keymap.set(
    "n",
    "<C-l>",
    "<cmd>TmuxNavigateRight<CR>",
    { desc = "Tmux navigate right" }
)

-- custom oil mappings
vim.keymap.set(
    "n",
    "-",
    "<CMD>Oil --float<CR>",
    { desc = "Open parent directory" }
)
