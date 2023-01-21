local key = U.make_key({ noremap = true, silent = true })

-- move selected stuff
key("v", "J", ":m '>+1<CR>gv=gv")
key("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle of page
key("n", "<C-d>", "<C-d>zz")
key("n", "<C-u>", "<C-u>zz")

-- same for searching
key("n", "n", "nzzzv")
key("n", "N", "Nzzzv")

-- overwriting over selected stuff and throwing selected stuff into void
key("x", "<leader>p", [["_dP]])

-- copy into system clipboard
key({ "n", "v" }, "<leader>y", [["+y]])
key("n", "<leader>Y", [["+Y]])

-- delete stuff and dont put it into register
key({ "n", "v" }, "<leader>d", [["_d]])

-- format
key("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- replace all words the cursor is on with given text
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- split navigation
key("n", "<C-h>", "<C-w>h")
key("n", "<C-j>", "<C-w>j")
key("n", "<C-k>", "<C-w>k")
key("n", "<C-l>", "<C-w>l")
