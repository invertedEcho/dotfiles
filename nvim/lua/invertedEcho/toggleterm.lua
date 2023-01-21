require("toggleterm").setup{}

local key = U.make_key({ noremap = true, silent = true })

key("n", "<leader>tt", U.make_cmd("ToggleTerm"))
key("t", "<Esc>", "<C-\\><C-n>")
