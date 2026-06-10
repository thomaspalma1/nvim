local builtin = require("telescope.builtin")

-- Launch the fuzzy finder to search for files within the current workspace
-- directory by their names, allowing rapid navigation across the project
-- without manually expanding folders.
vim.keymap.set("n", "<leader>ff", builtin.find_files)

-- Perform a live grep search to find specific strings, keywords, or text
-- patterns across all files in the project, dynamically updating the
-- matching results as you type the query.
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

-- Open a list of all currently active buffers, providing a quick visual
-- interface to jump between open files, close them, or check their
-- unsaved modifications.
vim.keymap.set("n", "<leader>fb", builtin.buffers)

-- Search through Neovim's native help documentation and
-- installed plugin manuals, making it easy to find commands, API
-- references, or syntax rules.
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- Invoke the interactive theme picker to dynamically browse, preview,
-- and apply available colorschemes in real-time before committing to
-- a permanent visual change.
vim.keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<CR>")
