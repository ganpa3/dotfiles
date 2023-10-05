vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex)

vim.keymap.set("n", "<C-q>", ":wq!<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-c>", ":qa!<CR>")
vim.keymap.set("n", "<C-x>", ":q!<CR>")
vim.keymap.set("n", "<C-w>", ":tabclose<CR>")

vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")

vim.keymap.set("n", "<TAB>", ":tabnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":tabprevious<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/ganpa/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

