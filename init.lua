-- Establish the foundational behavior of the editor by loading native
-- Neovim settings. Global keybindings and automatic behaviors are
-- applied immediately after.
require("core.settings")
require("keymaps")
require("autocmds")

-- Set the colorscheme early in the initialization process to prevent
-- visual flashes and ensure that UI plugins inherit the correct colors.
require("themes.colorscheme")
require("themes.theme-picker")

-- Initialize visual elements and utility plugins, setting up the status line,
-- tab bar, file explorer, fuzzy finder, and cursor animations.
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.indent-blankline")
require("plugins.smear-cursor")

-- Load keybindings specific to plugins only after the plugins themselves
-- have been fully initialized to prevent missing function errors.
require("keymaps.nvim-tree")
require("keymaps.telescope")

-- Initialize the package manager first to ensure all external binaries and
-- dependencies are available on the system. Once they are ready, load the
-- autocompletion engine and configure the language servers.
require("plugins.mason")
require("plugins.blink-cmp")
require("lsp")
