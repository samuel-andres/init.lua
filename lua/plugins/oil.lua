return {
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    event = { 'VimEnter */*,.*', 'BufNew */*,.*' },
    config = function()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>')
      require('oil').setup {
        default_file_explorer = true,
        use_default_keymaps = false,
        keymaps = {
          ['?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<Tab>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['gs'] = 'actions.change_sort',
          ['g.'] = 'actions.toggle_hidden',
        },
      }
    end,
  },
}
