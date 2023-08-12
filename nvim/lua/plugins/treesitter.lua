return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
		if not status_ok then return end

		treesitter_configs.setup({
			ensure_installed = {
				'javascript',
				'typescript',
				'tsx',
				'lua',
				'markdown',
				'html',
				'json',
				'vim',
			},
			auto_install = true,
			ignore_install = {},
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			autotag = {
				enable = true,
			},
		})
	end
}
