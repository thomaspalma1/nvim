-- Auto insert stuff
vim.keymap.set('i', '(', '()<Esc>i')
vim.keymap.set('i', '[', '[]<Esc>i')
vim.keymap.set('i', '{', '{}<Esc>i')
vim.keymap.set('i', "'", "''<Esc>i")
vim.keymap.set('i', '"', '""<Esc>i')

-- Auto-pairs novos (Lado Direito)
vim.keymap.set('i', ')', '()<Esc>i')
vim.keymap.set('i', ']', '[]<Esc>i')
vim.keymap.set('i', '}', '{}<Esc>i')


-- Wrap visual selection in quotation marks or brackets
vim.keymap.set('v', '(', 'c()<Esc>P')
vim.keymap.set('v', ')', 'c()<Esc>P')
vim.keymap.set('v', '[', 'c[]<Esc>P')
vim.keymap.set('v', ']', 'c[]<Esc>P')
vim.keymap.set('v', '{', 'c{}<Esc>P')
vim.keymap.set('v', '}', 'c{}<Esc>P')
vim.keymap.set('v', "'", "c''<Esc>P")
vim.keymap.set('v', '"', 'c""<Esc>P')

-- Move lines around
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')
