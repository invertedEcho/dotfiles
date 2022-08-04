return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.stdpath("data") .. "/site/pack/packer/start"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
