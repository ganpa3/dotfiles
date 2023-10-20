---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-q>"] = { ":wq!<CR>", "Save and Quit" },
    ["<C-s>"] = { ":w<CR>", "Save" },
    ["<C-c>"] = { ":qa!<CR>", "Quit all files" },
    ["<C-w>"] = { ":q!<CR>", "Quit current buffer" },
    ["<C-x>"] = { ":q!<CR>", "Quit current buffer" },

    ["<C-/>"] = { "<plug>NERDCommenterToggle", "Toggle comment" },
  },
  v = {
    [">"] = { ">gv", "indent" },

    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected lines down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected lines up" },

    ["<C-/>"] = { "<plug>NERDCommenterToggle", "Toggle comment" },
  },
  x = {
    ["<leader>p"] = { [["_dP]] },
  },
}

-- more keybinds!

return M
