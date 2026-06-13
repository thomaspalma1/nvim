vim.pack.add({
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		src = "https://github.com/nvim-tree/nvim-tree.lua",
	},
})

-- Disable Neovim's built-in file explorer (netrw) completely to 
-- prevent unexpected conflicts and ensure Nvim-Tree exclusively 
-- handles all directory operations.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit RGB true color support in the terminal to guarantee 
-- that file icons and syntax highlighting elements render accurately.
vim.opt.termguicolors = true

local config = {
	sort = {
		-- Organize files and directories alphabetically using case-sensitive 
		-- sorting to maintain a predictable and structured visual hierarchy.
		sorter = "case_sensitive",
	},
	view = {
		-- Lock the sidebar file explorer width to a fixed number of columns 
		-- to maintain a consistent layout alongside open code buffers.
		width = 30,
	},
	renderer = {
		-- Collapse empty parent directories into a single compact line 
		-- (similar to GitHub's UI) to save vertical space and reduce 
		-- visual clutter in nested projects.
		group_empty = true,
	},
	filters = {
		-- Hide dotfiles and hidden system directories by default to keep 
		-- the project tree clean and strictly focused on source code.
		dotfiles = true,
	},
}

require("nvim-tree").setup(config)
