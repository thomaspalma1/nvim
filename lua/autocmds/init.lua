-- Highlight on Yank
-- Briefly highlights the yanked (copied) text for better visual feedback.

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		-- 1. Ensure the highlight group exists (survives colorscheme changes)
		vim.api.nvim_set_hl(0, "CustomYankHighlightColor", { bg = "#8f94fb", fg = "#ffffff", bold = true })

		-- 2. Apply the custom highlight group for 300 milliseconds
		vim.highlight.on_yank({ higroup = "CustomYankHighlightColor", timeout = 300 })
	end,
})
