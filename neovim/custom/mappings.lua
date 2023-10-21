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

    ["gd"] = { "gd", "Goto local declaration" },

    ["<leader>gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
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

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fc"] = { "<cmd> Telescope grep_string <CR>", "Grep the word under cursor" },
  },
}

return M
