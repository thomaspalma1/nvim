-- Define the file path used to persist the active theme across sessions 
-- and establish a reliable fallback option.
local theme_file = vim.fn.stdpath("data") .. "/current_theme.txt"
local default_theme = "default"
local success = false

-- Attempt to read the previously saved theme from the file and apply it safely.
if vim.fn.filereadable(theme_file) == 1 then
	local saved_theme = vim.fn.readfile(theme_file)[1]
	success = pcall(vim.cmd, "colorscheme " .. saved_theme)
end

-- Apply the default theme if the state file does not exist or if the 
-- saved theme fails to load.
if not success then
	vim.cmd("colorscheme " .. default_theme)
end

-- Automatically update the persisted file whenever the user changes 
-- the colorscheme during the current session.
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("ThemePersistence", { clear = true }),
	callback = function()
		local current_theme = vim.g.colors_name or default_theme
		vim.fn.writefile({ current_theme }, theme_file)
	end,
})
