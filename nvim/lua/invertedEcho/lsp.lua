-- TODO: great, now we have this one object with this huge setup function
return {
  setup = function ()
    local lsp_zero = require("lsp-zero")
    -- TODO: cmp should not just be a dep of lsp zero but its own field with its own config file.
    local cmp = require('cmp')
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
	['<c-j>'] = cmp.mapping.select_next_item(),
      ['<c-k>'] = cmp.mapping.select_prev_item(),
	['<C-i>'] = cmp.mapping.confirm({ select = true })
      })
    })

    lsp_zero.on_attach(function(_, bufnr)

      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
	lsp_zero.default_setup,
      }
    })

    set_key("n", "gR", vim.lsp.buf.references)
    set_key("n", "<leader>rn", vim.lsp.buf.rename)
  end
}
