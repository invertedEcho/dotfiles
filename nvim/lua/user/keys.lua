local toggleterm = require("user.toggleterm")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key = U.make_key({ noremap = true, silent = true })

-- insert mode
key("i", "<c-h>", "<left>")
key("i", "<c-j>", "<down>")
key("i", "<c-k>", "<up>")
key("i", "<c-l>", "<right>")

-- terminal
key("n", "<leader>tt", toggleterm.toggleDefault)
key("t", "<Esc>", "<C-\\><C-n>")

-- split navigation
key("n", "<c-h>", "<c-w>h")
key("n", "<c-j>", "<c-w>j")
key("n", "<c-k>", "<c-w>k")
key("n", "<c-l>", "<c-w>l")

-- navigation
key("n", "J", "10j")
key("n", "K", "10k")
key("n", "H", "10h")
key("n", "L", "10l")

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
key(
	"n",
	"ga",
	U.bind(require("telescope").extensions.code_actions.code_actions, require("telescope.themes").get_dropdown({}))
)
