-- Telescope (Fuzzy Finder)
-- Highly extendable fuzzy finder over lists (files, commits, grep, etc.).
-- Requires plenary.nvim as a core dependency for its internal functions.

vim.pack.add({
    {
        src = "https://github.com/nvim-lua/plenary.nvim"
    },
    {
        src = "https://github.com/nvim-telescope/telescope.nvim"
    }
})

-- Initialize Telescope with default settings
require("telescope").setup({})
