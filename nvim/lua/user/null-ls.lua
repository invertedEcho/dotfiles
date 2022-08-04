local null_ls = require("null-ls")
local handlers = require("user.lsp")


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettierd,
		diagnostics.eslint_d,
	},
	on_attach = handlers.on_attach,
})
