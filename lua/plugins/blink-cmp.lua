vim.pack.add({
	{
		src = "https://github.com/saghen/blink.lib",
	},
	{
		src = "https://github.com/saghen/blink.cmp",
	},
})

require("blink.cmp").setup({
	-- Configure the keyboard behavior using the 'super-tab' preset,
	-- allowing intuitive navigation through completion options with
	-- the Tab key and quick confirmation using Enter.
	keymap = { preset = "super-tab" },

	appearance = {
		-- Inherit highlight groups from the active colorscheme to ensure
		-- the completion menu blends seamlessly with the current visual
		-- aesthetics without breaking the layout.
		use_nvim_cmp_as_default = true,

		-- Set the Nerd Font variant to 'mono' to maintain consistent
		-- icon spacing and prevent visual alignment bugs within the
		-- completion dropdown.
		nerd_font_variant = "mono",
	},

	sources = {
		-- Prioritize completion suggestions by defining the source hierarchy:
		-- language server intelligence first, followed by file paths,
		-- code snippets, and finally active buffer words.
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- Enable the floating signature help window to automatically display
	-- function parameter documentation and type hints while typing
	-- inside parentheses.
	signature = { enabled = true },
})
