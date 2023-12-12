local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-telescope/telescope.nvim",
        opts = overrides.telescope,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "dracula/vim",
        name = "dracula",
        config = function()
            vim.cmd("colorscheme dracula")
        end,
    },

    {
        "preservim/nerdcommenter",
    },

    {
        "tpope/vim-fugitive",
        lazy = false,
    },

    {
        "tpope/vim-rhubarb",
        lazy = false,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        opts = {
            max_lines = 3,
        },
        config = function()
            require("treesitter-context").setup {
                max_lines = 3,
            }
        end,
    },

    {
        "junegunn/fzf",
        name = "fzf",
        build = "./install --all",
        lazy = false,
    },

    {
        "junegunn/fzf.vim",
        cmd = { "Rg" },
        config = function()
            vim.g.fzf_vim = {
                preview_window = { "right,70%", "ctrl-/" },
            }
        end,
        -- lazy = false,
    },

    {
        "folke/trouble.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
