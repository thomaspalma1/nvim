vim.pack.add({
	{
		src = "https://github.com/saghen/blink.lib",
	},
	{
		src = "https://github.com/saghen/blink.cmp",
	},
})

require("blink.cmp").setup({
	-- Comportamento do teclado (Tab para navegar nas opções, Enter para confirmar)
	keymap = { preset = "super-tab" },

	appearance = {
		-- Herda as cores do seu tema nativo para não quebrar o visual
		use_nvim_cmp_as_default = true,
		-- Estilo da fonte dos ícones (ajuste para 'normal' se ficarem bugados)
		nerd_font_variant = "mono",
	},

	sources = {
		-- Ordem das sugestões: Inteligência da linguagem > pastas > recortes > palavras do arquivo
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- Ativa a janela flutuante com a documentação de parâmetros das funções
	signature = { enabled = true },
})
