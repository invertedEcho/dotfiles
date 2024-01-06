local M = {}

M.setup = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  lspkind.init({
    mode = 'text_symbol',
    preset = 'codicons',
  })

  ---@diagnostic disable-next-line: redundant-parameter Some day I will take a look at this
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<c-j>'] = cmp.mapping.select_next_item(),
      ['<c-k>'] = cmp.mapping.select_prev_item(),
      ['<c-b>'] = cmp.mapping.scroll_docs(-4),
      ['<c-f>'] = cmp.mapping.scroll_docs(4),
      ['<c-space>'] = cmp.mapping.complete(),
      ['<c-e>'] = cmp.mapping.abort(),
      ['<c-i>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 10 },
      { name = 'nvim_lua', priority = 9 },
      { name = 'luasnip', priority = 8 },
    }, {
      { name = 'buffer', priority = 1 },
    }),
    experimental = { ghost_text = true },
    window = {
      completion = cmp.config.window.bordered({}),
      documentation = cmp.config.window.bordered({}),
      scrollbar = false,
    },
    completion = {
      completeopt = 'menu,menuone,preview,noselect',
    },
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = '...',
      }),
    },
  })
end

return M
