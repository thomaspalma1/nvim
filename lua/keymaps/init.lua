-- Auto-Pairs (Insert Mode)
-- Automatically close parentheses, brackets, braces, and quotes.
-- Mechanics: Types both characters (e.g., '()'), escapes to Normal mode ('<Esc>'),
-- then re-enters Insert mode ('i') to place the cursor exactly in the middle.

-- Left side (Standard opening)
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "'", "''<Esc>i")
vim.keymap.set("i", '"', '""<Esc>i')

-- Right side (Fallback if the user types the closing character first)
vim.keymap.set("i", ")", "()<Esc>i")
vim.keymap.set("i", "]", "[]<Esc>i")
vim.keymap.set("i", "}", "{}<Esc>i")

-- Wrap Visual Selection (Visual Mode)
-- Wraps the currently selected text in parentheses, brackets, braces, or quotes.
-- Mechanics: Cuts the selection ('c'), types the wrapper (e.g., '()'),
-- escapes to Normal mode ('<Esc>'), and pastes the cut text inside ('P').

vim.keymap.set("v", "(", "c()<Esc>P")
vim.keymap.set("v", ")", "c()<Esc>P")
vim.keymap.set("v", "[", "c[]<Esc>P")
vim.keymap.set("v", "]", "c[]<Esc>P")
vim.keymap.set("v", "{", "c{}<Esc>P")
vim.keymap.set("v", "}", "c{}<Esc>P")
vim.keymap.set("v", "'", "c''<Esc>P")
vim.keymap.set("v", '"', 'c""<Esc>P')

-- Move Lines (Normal Mode)
-- Moves the current line up or down while keeping the correct indentation.
-- Mechanics: Uses the command-line command ':m' to move the current line ('.')
-- down (+1) or up (-2). '<CR>' executes the command, and '==' re-indents the line.

vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")

-- Allow a fast and ergonomic exit from insert mode by mapping the 'jk' 
-- sequence to the Escape key, keeping hands positioned on the home row.
vim.keymap.set("i", "jk", "<Esc>")
