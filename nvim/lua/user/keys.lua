local toggleterm = require("user.toggleterm")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key = U.make_key({ noremap = true, silent = true })

-- insert mode
key("i", "jk", "<esc>")

-- terminal
key("n", "<leader>tt", toggleterm.toggleDefault)
key("t", "<Esc>", "<C-\\><C-n>")

-- split navigation
key("n", "<c-h>", "<c-w>h")
key("n", "<c-j>", "<c-w>j")
key("n", "<c-k>", "<c-w>k")
key("n", "<c-l>", "<c-w>l")

-- nvimtree
key("n", "<c-n>", U.make_cmd("NvimTreeFocus"))

-- buffers
key("n", "<tab>", U.make_cmd("BufferLineCycleNext"))
key("n", "<s-tab>", U.make_cmd("BufferLineCycleNext"))
key("n", "<s-t>", U.make_cmd("tabnew"))
key("n", "<leader>x", U.make_cmd("BufDel"))

-- misc
key("n", "<c-s>", U.make_cmd("w"))

-- telescope
key("n", "<leader>f", U.make_cmd("Telescope find_files"))
key("n", "<c-t>", U.make_cmd("Telescope live_grep"))

-- debugging plugin
key("v", "<s-k>", U.make_cmd("lua require('dapui').eval()"))
key("n", "tb", U.make_cmd("lua require('dap').toggle_breakpoint()"))
key("n", "tc", U.make_cmd("lua require('dap').continue()"))
key("n", "tt", U.make_cmd("lua require('dap').step_over()"))
key("n", "ti", U.make_cmd("lua require('dap').step_into()"))
key("n", "tq", U.make_cmd("lua require('dap').terminate()"))
