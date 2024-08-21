-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Close buffer with leader x
vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Resizing actions
vim.keymap.set('n', '<C-w><S-j>', ':resize -5<CR>', { desc = 'Resize window down', silent = true })
vim.keymap.set('n', '<C-w><S-k>', ':resize +5<CR>', { desc = 'Resize window up', silent = true })
vim.keymap.set('n', '<C-w><S-l>', ':vertical resize -5<CR>', { desc = 'Resize window right', silent = true })
vim.keymap.set('n', '<C-w><S-h>', ':vertical resize +5<CR>', { desc = 'Resize window left', silent = true })
