return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    dependencies = { 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args) vim.snippet.expand(args.body) end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
        },
        sources = {
          { name = 'lazydev', group_index = 0 },
          { name = 'path' },
          { name = 'nvim_lsp' },
        },
      }
    end,
  },
}
