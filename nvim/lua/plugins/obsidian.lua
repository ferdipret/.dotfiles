local function table_length(T)
	local count = 0
	for _ in pairs(T) do
		count = count + 1
	end
	return count
end

return {
	"epwalsh/obsidian.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<leader>ns", "<cmd>ObsidianSearch<CR>", desc = "Search" },
		{ "<leader>nd", "<cmd>ObsidianToday<CR>", desc = "Daily" },
	},
	config = function()
		local status_ok, obsidian = pcall(require, "obsidian")

		vim.keymap.set("n", "gf", function()
			if not status_ok then
				return "gf"
			end

			if obsidian.util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })

		obsidian.setup({
			dir = "~/notes",
			daily_notes = {
				folder = "/dailies",
			},
			note_frontmatter_func = function(note)
				local out = { slug = note.id, aliases = note.aliases, tags = note.tags }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and table_length(note.metadata) > 0 then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,
			completion = {
				nvim_cmp = true,
			},
		})
	end,
}
