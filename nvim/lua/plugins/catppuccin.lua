return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	config = function()
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
	opts = {
		integrations = {
			neotree = true
		}
	}
}
