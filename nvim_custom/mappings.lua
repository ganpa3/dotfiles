---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        ["<C-q>"] = { ":wq!<CR>", "Save and Quit" },
        ["<C-s>"] = { ":w<CR>", "Save" },
        ["<C-c>"] = { ":qa!<CR>", "Quit all files" },
        ["<C-w>"] = { ":q!<CR>", "Quit current buffer" },
        ["<C-x>"] = {
            function()
                require("nvchad.tabufline").close_buffer()
            end,
            "Close buffer",
        },
        -- ["<C-x>"] = { ":q!<CR>", "Quit current buffer" },

        ["<C-/>"] = { "<plug>NERDCommenterToggle", "Toggle comment" },

        ["gd"] = { "gd", "Goto local declaration" },
        ["gr"] = {
            function()
                require("trouble").toggle "lsp_references"
            end,
            "Goto local declaration",
        },

        ["<leader>gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "LSP definition",
        },

        ["[c"] = {
            function()
                require("treesitter-context").go_to_context()
            end,
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
        ["<leader>fb"] = {
            "<cmd> Telescope buffers sort_mru=true ignore_current_buffer=true <CR>",
            "Find buffers",
        },
        ["<leader>fc"] = { "<cmd> Telescope grep_string <CR>", "Grep the word under cursor" },

        ["<leader>fs"] = {
            function()
                require("telescope.builtin").grep_string {
                    search = vim.fn.input "Grep > ",
                    use_regex = true,
                }
            end,
            "Grep a string",
        },
    },
}

M.trouble = {
    plugin = true,

    n = {
        ["<leader>xx"] = {
            function()
                require("trouble").toggle()
            end,
            "Grep a string",
        },
        ["<leader>x"] = {
            "",
        },
        ["<leader>xw"] = {
            function()
                require("trouble").toggle "workspace_diagnostics"
            end,
        },
        ["<leader>xd"] = {
            function()
                require("trouble").toggle "document_diagnostics"
            end,
        },
        ["<leader>xq"] = {
            function()
                require("trouble").toggle "quickfix"
            end,
        },
        ["<leader>xl"] = {
            function()
                require("trouble").toggle "loclist"
            end,
        },
        -- ["gr"] = {
        -- "<cmd> Trouble <CR>",
        -- function()
        --   require("trouble").toggle "lsp_references"
        -- end,
        -- "LSP references",
        -- },
    },
}

return M
