-- Mason (Plugin Manager for LSPs and Tools)
-- The goal of Mason is to easily install and manage LSP servers, DAP servers, linters, 
-- and formatters, instead of having to install everything manually. 
-- Mason only handles the downloading and installation of the binaries. It works 
-- hand-in-hand with 'mason-lspconfig' and 'nvim-lspconfig' to actually wire 
-- these installed servers into Neovim and attach them to your buffers.

vim.pack.add({ "https://github.com/williamboman/mason.nvim" })

-- 1. Initialize the plugin with custom visual settings
-- Mechanics: Sets up the user interface to display specific symbols 
-- representing the installation status of each package.
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
