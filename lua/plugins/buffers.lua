return {
  'j-morano/buffer_manager.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('buffer_manager').setup()
    vim.keymap.set('n', '<C-e>', function() require('buffer_manager.ui').toggle_quick_menu() end)
  end,
}
