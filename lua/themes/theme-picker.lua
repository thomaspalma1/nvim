local theme_file = vim.fn.stdpath("data") .. "/current_theme.txt"
local default_theme = "default"
local success = false

-- Tenta ler o arquivo e aplicar o tema salvo
if vim.fn.filereadable(theme_file) == 1 then
	local saved_theme = vim.fn.readfile(theme_file)[1]
	success = pcall(vim.cmd, "colorscheme " .. saved_theme)
end

-- Se o arquivo não existir (success continua false) ou o pcall falhar, aplica o padrão
if not success then
	vim.cmd("colorscheme " .. default_theme)
end

-- Autocommand para salvar as alterações
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("ThemePersistence", { clear = true }),
	callback = function()
		local current_theme = vim.g.colors_name or default_theme
		vim.fn.writefile({ current_theme }, theme_file)
	end,
})
