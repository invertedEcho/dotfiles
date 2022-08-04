require("lsp_signature").setup()

local M = {}

local key = U.make_key({ noremap = true, silent = true })

local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(_, vim_item)
				return vim_item
			end,
		}),
	},
})

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-i>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	key("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	key("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	key("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	key("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	key("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
	key("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
	key("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
	key("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	key("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	key("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	key("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	key("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	key("n", "<space>dg", "<cmd>lua vim.diagnostic.goto_next()<CR>")
end

M.on_attach = on_attach

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"cssls",
	"cssmodules_ls",
	"emmet_ls",
	"html",
	"jsonls",
	"sumneko_lua",
	"tsserver",
	"yamlls",
	"bashls",
	"taplo",
	"pyright",
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if server == "sumneko_lua" then
		local _opts = require("user.sumneko")
		opts = vim.tbl_deep_extend("force", _opts, opts)
	end
	lspconfig[server].setup(opts)
end

return M
