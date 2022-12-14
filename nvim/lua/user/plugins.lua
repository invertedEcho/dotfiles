local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- package manager
	use("wbthomason/packer.nvim")

	-- better look
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("feline-nvim/feline.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("ray-x/lsp_signature.nvim")

	-- colorschemes
	use("folke/tokyonight.nvim")
	use("ayu-theme/ayu-vim")
	use({ "ellisonleao/gruvbox.nvim" })

	-- lsp stuff
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/nvim-lsp-installer")
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
	})
	-- misc helper stuff
	use("windwp/nvim-autopairs")
	use("ojroques/nvim-bufdel")
	use("karb94/neoscroll.nvim")

	-- auto completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- vsnip
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- terminal
	use("akinsho/toggleterm.nvim")

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("~/git-repos/telescope-code-actions.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- other misc plugins
	use("lewis6991/gitsigns.nvim")
	use("rcarriga/nvim-notify")
	use("stevearc/dressing.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- formatter
	use("averms/black-nvim")

	-- java
	use({ "mfussenegger/nvim-jdtls" })

	-- rust
	use({ "simrat39/rust-tools.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
