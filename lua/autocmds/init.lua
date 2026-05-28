-- Highlight on Yank
-- Briefly highlights the yanked (copied) text for better visual feedback.

-- 1. Define a custom highlight group with specific colors and font style
vim.api.nvim_set_hl(0, "CustomYankHighlightColor", { bg = "#8f94fb", fg = "#ffffff", bold = true })

-- 2. Create the autocommand triggered after yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  pattern = "*",
  callback = function()
    -- Apply the custom highlight group for 300 milliseconds
    vim.highlight.on_yank({ higroup = "CustomYankHighlightColor", timeout = 300 })
  end,
})
