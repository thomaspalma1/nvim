vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim",
	},
})

require("bufferline").setup({
	options = {
		-- Prevent buffer tabs from overlapping the sidebar file explorer
		-- by pushing the tabline to the right and displaying a centered,
		-- separated title for better visual hierarchy.
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
		-- Dynamically extract the background color from the editor's default
		-- highlight group (Normal) and apply it to the empty tabline space,
		-- ensuring seamless integration when switching colorschemes.
		fill = {
			bg = { attribute = "bg", highlight = "Normal" },
		},

		-- Blend the visual separators into the standard background color
		-- to remove harsh lines and maintain a consistent, minimal
		-- aesthetic across the top bar.
		separator = {
			bg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
