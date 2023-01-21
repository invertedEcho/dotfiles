require("bufferline").setup{}

local key = U.make_key({ noremap = true, silent = true })

key("n", "<tab>", U.make_cmd("BufferLineCycleNext"))
key("n", "<s-tab>", U.make_cmd("BufferLineCycleNext"))
key("n", "<s-t>", U.make_cmd("tabnew"))
key("n", "<leader>x", U.make_cmd("BufDel"))
