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
	-- Disable mason-lspconfig's automatic vim.lsp.enable()/vim.lsp.config()
	-- calls. Without this, mason-lspconfig registers its own default config
	-- for each installed server asynchronously, which can silently overwrite
	-- custom configs (like the pyright one below) defined further down in
	-- this file. Setting this to false makes mason-lspconfig responsible
	-- only for installing the servers, while enabling/configuring them
	-- remains fully under our control.
	automatic_enable = false,
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
vim.lsp.config('pyright', {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})
-- Automatically point pyright to the project's virtual environment
-- interpreter (created by tools like uv, venv, or virtualenv) so that
-- third-party packages installed there (e.g. pydantic, fastapi) are
-- correctly resolved instead of falling back to the system Python.
--
-- Note: this is implemented via the "LspAttach" autocommand rather than
-- an "on_new_config" callback. The latter was part of the legacy
-- nvim-lspconfig Server:setup() API and is NOT honored by Neovim's
-- native vim.lsp.config()/vim.lsp.enable() mechanism (0.11+), so it
-- would silently never run. Hooking into LspAttach guarantees this
-- logic runs after the client has actually attached, regardless of how
-- it was started (Mason, vim.lsp.enable, or manually).
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "pyright" then
			return
		end

		local root_dir = client.config.root_dir
		if not root_dir then
			return
		end

		local candidates = { ".venv", "venv", "env" }
		for _, name in ipairs(candidates) do
			local python_path = root_dir .. "/" .. name .. "/bin/python"
			if vim.fn.executable(python_path) == 1 then
				client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
					python = { pythonPath = python_path },
				})
				client:notify("workspace/didChangeConfiguration", { settings = client.settings })
				vim.notify("pyright pythonPath setado: " .. python_path)
				return
			end
		end

		vim.notify("pyright: nenhum venv encontrado em " .. root_dir, vim.log.levels.WARN)
	end,
})
