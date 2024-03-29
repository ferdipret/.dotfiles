return {
	'nvim-lua/plenary.nvim',
	'kdheepak/lazygit.nvim',
	'folke/which-key.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope.nvim',
	'ahmedkhalf/project.nvim',
	'nvim-lualine/lualine.nvim',
	'lewis6991/gitsigns.nvim',
	'windwp/nvim-autopairs',
	'lukas-reineke/indent-blankline.nvim',
	'kylechui/nvim-surround',
	'folke/trouble.nvim',
	'windwp/nvim-ts-autotag',
	'romgrk/barbar.nvim',
	'akinsho/toggleterm.nvim',
	{
		'epwalsh/obsidian.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	},
}
