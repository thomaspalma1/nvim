vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim",
	},
})

require("bufferline").setup({
	options = {
		-- Your existing options can stay here

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},

	highlights = {
		-- Targets the empty space after the buffer tabs
		fill = {
			-- Dynamically extracts the background color from the editor's default
			-- background (Normal) and applies it to the empty area.
			bg = { attribute = "bg", highlight = "Normal" },
		},
		-- Optional: If the separators between the empty space and the tabs also look
		-- disconnected, you can blend them in as well.
		separator = {
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
