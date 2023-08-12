return {
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>op", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Project sidebar" },
		},
		config = function()
			local options = {
				filters = {
					dotfiles = false,
					exclude = {},
				},
				git = {
					enable = true,
					ignore = false,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
				sync_root_with_cwd = true,
			}

			require("nvim-tree").setup(options)
		end,
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true },
		},
		keys = {
			{
				"<leader>oe",
				function()
					require("oil").open_float()
				end,
				desc = "explore",
			},
			{
				"<leader>fp",
				function()
					require("oil").open(vim.fn.getcwd())
				end,
				desc = "in project",
			},
		},
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
				default_file_explorer = false,
				keymaps = {
					-- Disable default window splitting keybinds
					["<C-l>"] = false,
					["<C-h>"] = false,

					-- Use the same split keybindings as Telescope
					["<C-v>"] = "actions.select_vsplit",
					["<C-x>"] = "actions.select_split",
				},
				float = {
					padding = 0,
					border = "",
					win_options = {
						winblend = 0,
					},
				},
			})
		end,
	},
}
