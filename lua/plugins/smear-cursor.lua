vim.pack.add({
	{
		src = "https://github.com/sphamba/smear-cursor.nvim",
	},
})

require("smear_cursor").setup({
	stiffness = 0.5,
	trailing_stiffness = 0.5,
	distance_stop_animating = 0.5,
})
