local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      -- "--smart-case",
      "--glob",
      "!**/tests/",
      "--glob",
      "!**/migrations/",
      "--glob",
      "!**/__snapshots__/",
      "--glob",
      "!*.spec.jsx",
      "--type-not",
      "po",
      "--type-not",
      "json",
    },
    -- layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        width = 0.99,
        preview_width = 0.6,
      },
      vertical = {
        height = 0.99,
        width = 0.99,
        preview_height = 0.7,
        preview_cutoff = 10,
      },
    },
  },
  pickers = {
    grep_string = {
      layout_strategy = "vertical",
    },
    live_grep = {
      layout_strategy = "vertical",
    },
  },
}

return M
