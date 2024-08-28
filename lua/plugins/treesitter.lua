return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    opts = {
      -- stylua: ignore
      ensure_installed = {
        'vim', 'vimdoc', 'lua', 'luadoc', 'diff', 'html', 'markdown', 'css', 'yaml',
        'javascript', 'typescript', 'tsx', 'python', 'c', 'bash', 'dockerfile',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy',
    opts = {},
    config = function() require('treesitter-context').setup { multiline_threshold = 1 } end,
  },
}
