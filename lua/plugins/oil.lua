return {
  'stevearc/oil.nvim',
  opts = {},
  cmd = 'Oil',
  event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '-', ':Oil<cr>')
  end,
}
