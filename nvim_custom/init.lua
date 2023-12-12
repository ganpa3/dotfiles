-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Load vim config
local vimrc = vim.fn.stdpath "config" .. "/lua/custom/vimrc.vim"
vim.cmd.source(vimrc)

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/my_snippets"
