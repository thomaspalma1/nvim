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

-- Auto-enter insert mode when a terminal is opened,
-- and redirect cursor-movement keys back to insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Start in insert mode as soon as the terminal opens
    vim.cmd("startinsert")

    local opts = { buffer = true, noremap = true, silent = true }
    -- Keys that would normally move the cursor letter by letter
    local keys_back_to_insert = { "h", "l", "<Left>", "<Right>" }

    for _, key in ipairs(keys_back_to_insert) do
      -- Instead of moving the cursor, jump back to insert mode
      vim.keymap.set("n", key, function()
        vim.cmd("startinsert")
      end, opts)
    end
  end,
})

-- Auto-enter insert mode when switching back to a terminal buffer
-- (covers buffer switching via Bufferline, e.g. <Space><Tab>)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})
