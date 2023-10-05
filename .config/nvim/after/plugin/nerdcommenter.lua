vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCustomDelimiters = {
    c = {
        left = "// "
    },
    python = {
        left = "#"
    }
}

vim.keymap.set({"n", "v"}, "<C-/>", "<plug>NERDCommenterToggle")
