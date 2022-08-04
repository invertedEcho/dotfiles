local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

toggleterm.setup({
	shell = "fish",
	direction = "float",
    on_open = function(term)
        vim.cmd("startinsert!")
        U.make_key({ noremap = true, buffer = term.bufnr, silent = true })("n", "q", U.make_cmd("close"))
    end,
	float_opts = {
		border = "curved",
		winblend = 1,
	},
})

local default = Terminal:new({})

M.toggleDefault = function()
	default:toggle(1, "float")
end

return M
