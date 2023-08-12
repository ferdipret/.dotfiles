return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>bb", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
		{ "<leader>bB", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,

			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,

			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
