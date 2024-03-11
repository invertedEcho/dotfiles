local M = {}
M.setup = function()
  local lsp_config = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local icons = require('invertedEcho.icons')

  vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
    config = config or {}
    config.focus_id = ctx.method
    if not (result and result.contents) then
      return
    end
    local markdown_lines =
      vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      return
    end
    return vim.lsp.util.open_floating_preview(
      markdown_lines,
      'markdown',
      config
    )
  end

  local signs = {
    {
      name = 'DiagnosticSignError',
      text = icons.diagnostics.error,
    },
    {
      name = 'DiagnosticSignWarn',
      text = icons.diagnostics.warning,
    },
    {
      name = 'DiagnosticSignHint',
      text = icons.diagnostics.hint,
    },
    {
      name = 'DiagnosticSignInfo',
      text = icons.diagnostics.info,
    },
  }

  ---@diagnostic disable-next-line: unused-local
  local function on_attach(client, bufnr)
    require('invertedEcho.formatter').on_attach(bufnr)

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(
        sign.name,
        { texthl = sign.name, text = sign.text, numhl = '' }
      )
    end

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require('invertedEcho.keymaps').lsp(bufnr)
  end

  local servers = {
    { name = 'lua_ls', settings = require('invertedEcho.lsp.settings.lua_ls') },
    { name = 'eslint' },
    { name = 'jsonls', settings = require('invertedEcho.lsp.settings.jsonls') },
    { name = 'rust_analyzer' },
    { name = 'astro' },
    { name = 'prismals' },
    { name = 'jedi_language_server' },
    { name = 'phpactor' },
    {
      name = 'tailwindcss',
      settings = require('invertedEcho.lsp.settings.tailwindcss'),
    },
    { name = 'pyright' },
    { name = 'mdx_analyzer' },
  }

  for _, server in ipairs(servers) do
    lsp_config[server.name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = server.settings,
    })
  end

  require('typescript').setup({
    go_to_source_definition = {
      fallback = true,
    },
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  })
end

return M
