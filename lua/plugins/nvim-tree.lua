vim.pack.add({
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons"
    },
    {
        src = "https://github.com/nvim-tree/nvim-tree.lua"
    }
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local config = {
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
}

require("nvim-tree").setup(config)
