vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' }
}

vim.lsp.enable({
  "pyright",
  "gopls",
  "html",
  "jsonls",
  "yamlls",
  "dockerls",
  "marksman",
})

vim.diagnostic.config({
  virtual_text = true,      	-- Shows errors as floating text at the end of the line
  signs = true,             	-- Shows icons in the left margin
  underline = true,         	-- Underlines errors/warnings
  update_in_insert = false, 	-- Does not update diagnostics while typing
  severity_sort = false,    	-- Orders errors by severity
})
