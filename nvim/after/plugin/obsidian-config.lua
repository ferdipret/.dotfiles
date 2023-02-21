local function table_length(T)
	local count = 0
	for _ in pairs(T) do
		count = count + 1
	end
	return count
end

require('obsidian').setup({
	dir = '~/notes',
	daily_notes = {
		folder = '/dailies',
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
