vim.pack.add({
	{
		src = "https://github.com/sphamba/smear-cursor.nvim",
	},
})

require("smear_cursor").setup({
	-- Control the primary responsiveness of the cursor animation. 
	-- Lower values make the movement slower and more elastic, while 
	-- higher values make the transition faster and snappier.
	stiffness = 0.5,

	-- Adjust the elasticity of the cursor's tail. Lower values create 
	-- a longer, lingering smear effect, while higher values force 
	-- the tail to retract and snap instantly behind the cursor.
	trailing_stiffness = 0.5,

	-- Define the movement threshold required to trigger the effect. 
	-- Lower values animate even tiny one-character steps, while higher 
	-- values restrict the visual effect strictly to larger cursor jumps.
	distance_stop_animating = 0.5,
})
