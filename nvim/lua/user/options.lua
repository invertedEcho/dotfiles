vim.opt.showmatch = true -- show matching
vim.opt.ignorecase = true -- case sensitive
vim.opt.mouse = "v" -- middle-click paste
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true -- incremental search
vim.opt.tabstop = 2 -- number of columns occupied by a tab
vim.opt.softtabstop = 2 -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- converts tabs to white space
vim.opt.shiftwidth = 2 -- width for autoindents
vim.opt.autoindent = true -- indent a new line the same amount as the line just typed
vim.opt.number = true -- add line numbers
vim.opt.mouse = "a" -- enable mouse click
vim.opt.clipboard = "unnamedplus" -- using system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true
vim.opt.splitright = true

vim.cmd("colorscheme onedarker")
