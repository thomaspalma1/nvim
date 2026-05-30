-- Appearance & UI
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true 	    -- Show relative line numbers (useful for movements like 5j, 10k)
vim.opt.cursorline = true           -- Highlight current line
vim.opt.cursorcolumn = true         -- Highlight current column
vim.opt.termguicolors = true        -- Enable 24-bit RGB colors
vim.opt.signcolumn = 'yes'          -- Always show sign column (prevents text shifting)
vim.opt.scrolloff = 10              -- Keep 10 lines visible above/below cursor

-- Indentation & Formatting
vim.opt.shiftwidth = 2              -- Number of spaces for each indentation level
vim.opt.tabstop = 2                 -- Number of spaces a tab counts for
vim.opt.autoindent = true           -- Copy indent from current line when starting new line
vim.opt.smartindent = true          -- Smart autoindenting when starting new line
vim.opt.wrap = true                 -- Wrap long lines
vim.opt.linebreak = true            -- Prevent words from being cut in half (word wrap)

-- Search Behavior
vim.opt.incsearch = true            -- Show search matches as you type
vim.opt.hlsearch = true             -- Highlight all search matches
vim.opt.ignorecase = true           -- Ignore case in search patterns
vim.opt.smartcase = true            -- Override ignorecase if search contains uppercase

-- Syntax & Highlighting
vim.cmd.syntax('on')                -- Enable syntax highlighting

-- Editor Behavior
vim.opt.updatetime = 250            -- Faster completion and better plugin responsiveness
vim.opt.clipboard = 'unnamedplus'   -- Use system clipboard for copy/paste

-- Encoding
vim.opt.encoding = 'utf-8'          -- Set file encoding to UTF-8

-- Global
vim.g.mapleader = " "				-- Establishes the Spacebar as the primary prefix for custom mappings.
