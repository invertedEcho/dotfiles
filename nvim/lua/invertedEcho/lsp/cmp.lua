local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<c-j>'] = cmp.mapping.select_next_item(),
    ['<c-k>'] = cmp.mapping.select_prev_item(),
    ['<C-i>'] = cmp.mapping.confirm({ select = true }),
  }),
})
