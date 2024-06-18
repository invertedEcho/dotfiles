local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'tailwindcss',
    'pyright',
    'bashls',
    'lua_ls',
    'phpactor',
    'jsonls',
    'vtsls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
