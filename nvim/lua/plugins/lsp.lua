return {
	-- LSP Support
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	-- Autocompletion
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'onsails/lspkind.nvim' },
	{ 'folke/lsp-colors.nvim' },

	-- Snippets
	{ 'L3MON4D3/LuaSnip' },
	{ 'rafamadriz/friendly-snippets' },
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = { 'lukas-reineke/lsp-format.nvim' },
	},
}
