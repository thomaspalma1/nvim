-- Highlight on Yank
-- Briefly highlights the yanked (copied) text for better visual feedback.

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		-- 1. Ensure the highlight group exists (survives colorscheme changes)
		vim.api.nvim_set_hl(0, "CustomYankHighlightColor", { bg = "#3399ff", fg = "#ffffff", bold = true })

		-- 2. Apply the custom highlight group for 300 milliseconds
		vim.highlight.on_yank({ higroup = "CustomYankHighlightColor", timeout = 300 })
	end,
})

-- Automatically displays the LSP error in a floating window when hovering the cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always', -- Shows where the error comes from (e.g., pyright, pylsp, etc.)
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
