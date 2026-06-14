-- Initialize language server protocols (LSP) and manage diagnostic
-- presentations to integrate real-time code analysis, error tracking,
-- and syntax validation directly into the editor interface.

vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
	},
	{
		src = "https://github.com/williamboman/mason-lspconfig.nvim",
	},
})

-- Automate the installation of essential language servers, focusing
-- primarily on DevOps, infrastructure as code, and backend development
-- tools to guarantee a consistent environment across machines.
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

-- Activate the configured language servers to attach them to the
-- corresponding file types, enabling intelligent code completion,
-- definitions, and real-time syntax checking.
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
	"html-lsp",
})

-- Shape the visual behavior of the diagnostic engine to display
-- warnings and errors without overwhelming the active workspace.
vim.diagnostic.config({
	-- Display diagnostic messages directly alongside the code on the same line.
	virtual_text = true,

	-- Render severity indicators (errors, warnings) in the leftmost gutter column.
	signs = true,

	-- Draw a visible underline beneath the specific code segment causing the issue.
	underline = true,

	-- Wait until insert mode is exited before refreshing diagnostics to
	-- prevent distracting visual shifts and interruptions while typing.
	update_in_insert = false,

	-- Prioritize more critical issues (e.g., rendering errors above hints)
	-- when multiple diagnostic messages overlap on the same line.
	severity_sort = true,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- Instruct the language server to recognize 'vim' as a valid
				-- global variable, eliminating false-positive "undefined global"
				-- warnings when editing Neovim configuration files.
				globals = { "vim" },
			},
		},
	},
})
