local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
    b.formatting.deno_fmt.with {
        extra_args = { "--line-width", "100", "--indent-width", "4" },
    },

    b.formatting.prettier.with {
        extra_args = { "--print-width", "100", "--tab-width", "4" },
        filetypes = { "html", "markdown", "css" },
    },

    -- Lua
    b.formatting.stylua.with {
        extra_args = { "--column-width", "100", "--indent-width", "4" },
    },

    -- cpp
    b.formatting.clang_format,

    -- python
    b.formatting.black.with {
        extra_args = { "--line-length", "100" },
    },
}

null_ls.setup {
    debug = true,
    sources = sources,
}
