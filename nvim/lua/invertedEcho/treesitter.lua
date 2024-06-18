require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'tsx',
    'javascript',
    'typescript',
    'css',
    'json',
    'toml',
    'rust',
    'comment',
  },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
