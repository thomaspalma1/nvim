-- LSP Configuration & Diagnostics
-- Bridges Neovim with the servers installed by Mason and controls the visual
-- presentation of diagnostics, dictating how code analysis and errors appear in the editor.

vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
	},
	{
		src = "https://github.com/williamboman/mason-lspconfig.nvim",
	},
})

-- Ensure the following LSP servers are installed
-- Primarily focused on DevOps and Back-end development
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"bashls",
		"docker_compose_language_service",
		"dockerls",
		"jsonls",
		"lua_ls",
		"marksman",
		"nginx_language_server",
		"pyright",
		"terraformls",
		"yamlls",
		"ruff",
	},
})

-- Enable and initialize LSP servers
vim.lsp.enable({
	"ansiblels",
	"bashls",
	"docker_compose_language_service",
	"dockerls",
	"jsonls",
	"lua_ls",
	"marksman",
	"nginx_language_server",
	"pyright",
	"terraformls",
	"yamlls",
	"ruff",
})

-- Diagnostic UI Configuration
-- Controls how syntax hints and code errors appear within the text editor.
vim.diagnostic.config({
	virtual_text = true, -- Show inline text diagnostics
	signs = true, -- Show icons in the sign column
	underline = true, -- Underline diagnostic issues
	update_in_insert = false, -- Delay updates until leaving insert mode
	severity_sort = true, -- Sort diagnostics by severity
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- Diz ao servidor de linguagem para reconhecer o 'vim' como uma variável global válida
				globals = { "vim" },
			},
		},
	},
})
