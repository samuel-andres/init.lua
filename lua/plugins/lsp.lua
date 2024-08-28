return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'hrsh7th/cmp-nvim-lsp',
      { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc }) end

          map('gr', '<cmd>Pick lsp scope="references"<cr>', '[G]oto [R]eferences')
          map('gI', '<cmd>Pick lsp scope="implementation"<cr>', '[G]oto [I]mplementation')
          map('<leader>D', '<cmd>Pick lsp scope="type_definition"<cr>', 'Type [D]efinition')
          map('<leader>ds', '<cmd>Pick lsp scope="document_symbol"<cr>', '[D]ocument [S]ymbols')
          map('<leader>ws', '<cmd>Pick lsp scope="workspace_symbol"<cr>', '[W]orkspace [S]ymbols')
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        pyright = {
          capabilities = { textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } } },
          settings = { python = { analysis = { typeCheckingMode = 'off' } } },
        },
        lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua', 'html-lsp', 'css-lsp', 'tsserver', 'dockerls', 'angular-language-server' })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
      require('ufo').setup()
    end,
  },
}
