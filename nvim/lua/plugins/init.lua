local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- Git
	use("kdheepak/lazygit.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- UI
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("plugins.ui.colorschemes.tokyonight").setup()
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.ui.whichkey").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.ui.lualine").setup()
		end,
	})
	use({
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup()
		end,
	})

	-- Utils
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("nvim-treesitter.configs").setup({
				context_commentstring = {
					enable = true,
				},
			})
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})

	-- File management
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				hijack_netrw = false,
			})
		end,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use("elihunter173/dirbuf.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.utils.treesitter").setup()
		end,
	})

	-- LSP
	use({"neovim/nvim-lspconfig", config = function ()
	 require('plugins.lsp')
	end})
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({"jose-elias-alvarez/null-ls.nvim", config = function ()
	 require('plugins.lsp.null-ls').setup()
	end})

	-- CMP
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.lsp.cmp").setup()
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
