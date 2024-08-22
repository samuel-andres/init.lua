return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.icons').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.cursorword').setup()
      require('mini.extra').setup()

      require('mini.ai').setup { n_lines = 500 }
      require('mini.notify').setup { window = { max_width_share = 0.764 } }
      require('mini.basics').setup { options = { basic = false }, mappings = { basic = false, option_toggle_prefix = '' } }

      require('mini.base16').setup {
        palette = {
          base00 = '#32302f',
          base01 = '#3c3836',
          base02 = '#5a524c',
          base03 = '#7c6f64',
          base04 = '#bdae93',
          base05 = '#ddc7a1',
          base06 = '#ebdbb2',
          base07 = '#fbf1c7',
          base08 = '#ea6962',
          base09 = '#e78a4e',
          base0A = '#d8a657',
          base0B = '#a9b665',
          base0C = '#89b482',
          base0D = '#7daea3',
          base0E = '#d3869b',
          base0F = '#bd6f3e',
        },
      }

      local colors = require 'mini.colors'
      colors.setup()
      colors.get_colorscheme():add_transparency():apply()

      require('mini.pick').setup {
        window = {
          config = {
            anchor = 'NW',
            row = math.floor(0.5 * (vim.o.lines - math.floor(0.618 * vim.o.lines))),
            col = math.floor(0.5 * (vim.o.columns - math.floor(0.618 * vim.o.columns))),
          },
        },
      }
      vim.keymap.set('n', '<leader>hh', '<cmd>Pick help<cr>', { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', '<cmd>Pick keymaps<cr>', { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', '<cmd>Pick files<cr>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', '<cmd>Pick grep_live tool="rg"<cr>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', '<cmd>Pick diagnostic<cr>', { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', '<cmd>Pick resume<cr>', { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', '<cmd>Pick oldfiles<cr>', { desc = '[S]earch Recent Files' })
      vim.keymap.set('n', '<leader><leader>', '<cmd>Pick buffers<cr>', { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sc', '<cmd>Pick git_hunks<cr>', { desc = '[S]earch [C]hanges' })
      vim.keymap.set('n', '<leader>sh', "<cmd>Pick git_hunks path='%' n_context=0<cr>", { desc = '[S]earch [H]unks' })
      vim.keymap.set('n', '<leader>sz', '<cmd>Pick buf_lines scrope="current"<cr>', { desc = '[S]earch on [C]Current buffer' })
      vim.keymap.set('n', '<leader>sp', '<cmd>Pick registers<cr>', { desc = '[S]earch [P]aste registers' })

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end

      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },
          { mode = 'i', keys = '<C-x>' },
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },
          { mode = 'n', keys = '<C-w>' },
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }

      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
}
