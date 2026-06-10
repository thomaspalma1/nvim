-- Show or hide the file explorer panel.
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {
	noremap = true,
	silent = true,
})
