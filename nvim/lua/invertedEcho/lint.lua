require('lint').linters_by_ft = {
  python = { 'pylint' },
  typescript = { ' eslint ' },
  typescriptreact = { 'eslint' },
  nix = { 'nix' },
}
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
