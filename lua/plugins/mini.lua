return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.pick').setup()
      require('mini.icons').setup()
      require('mini.pairs').setup()
      require('mini.extra').setup()
      require('mini.notify').setup()
      require('mini.surround').setup()
      require('mini.cursorword').setup()
      require('mini.statusline').setup()

      require('mini.base16').setup {
        -- stylua: ignore
        palette = {
          base00 = '#32302f', base01 = '#3c3836', base02 = '#5a524c', base03 = '#7c6f64',
          base04 = '#bdae93', base05 = '#ddc7a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
          base08 = '#ea6962', base09 = '#e78a4e', base0A = '#d8a657', base0B = '#a9b665',
          base0C = '#89b482', base0D = '#7daea3', base0E = '#d3869b', base0F = '#bd6f3e',
        },
      }

      local colors = require 'mini.colors'
      colors.setup()
      colors.get_colorscheme():add_transparency():apply()

      vim.keymap.set('n', '<leader>hh', '<cmd>Pick help<cr>')
      vim.keymap.set('n', '<leader>sf', '<cmd>Pick files<cr>')
      vim.keymap.set('n', '<leader>sr', '<cmd>Pick resume<cr>')
      vim.keymap.set('n', '<leader>sk', '<cmd>Pick keymaps<cr>')
      vim.keymap.set('n', '<leader>s.', '<cmd>Pick oldfiles<cr>')
      vim.keymap.set('n', '<leader>sp', '<cmd>Pick registers<cr>')
      vim.keymap.set('n', '<leader>sd', '<cmd>Pick diagnostic<cr>')
      vim.keymap.set('n', '<leader><leader>', '<cmd>Pick buffers<cr>')
      vim.keymap.set('n', '<leader>sg', '<cmd>Pick grep_live tool="rg"<cr>')
      vim.keymap.set('n', '<leader>sc', '<cmd>Pick git_files scope="modified"<cr>')
      vim.keymap.set('n', '<leader>sz', '<cmd>Pick buf_lines scrope="current"<cr>')
      vim.keymap.set('n', '<leader>sh', "<cmd>Pick git_hunks path='%' n_context=0<cr>")

      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        },
      }
    end,
  },
}
