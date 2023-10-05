-- Load vim config
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


-- Lua config
require("mason").setup()
require("mason-lspconfig").setup()


vim.keymap.set('n', '<space>n', '<cmd>cnext<CR>')
vim.keymap.set('n', '<space>p', '<cmd>cprevious<CR>')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
local util = require("lspconfig/util")

-- Setup language servers.
lspconfig.pyright.setup({
    root_dir = function(fname)
                return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
                    util.path.dirname(fname)
                end,
    capabilities = capabilities,
    settings = {
        disableLanguageServices = true,
        typeCheckingMode = "off",
        reportUndefinedVariable = "none",
        reportMissingImports = "none",
        reportMissingModuleSource = "none",
        disableOrganizeImports = true,
    }
})

lspconfig.tsserver.setup {
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ['rust-analyzer'] = {},
    },
    capabilities = capabilities,
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- Formatter config
-- Utilities for creating configurations
local formatter_util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--style=file",
            "--fallback-style=google",
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
        }
      end
    },

    c = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--style=file",
            "--fallback-style=google",
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
          },
          stdin = true,
        }
      end
    },

    javascript = {
      require("formatter.filetypes.javascript").prettier
    },

    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- nvim-lint config
require("lint").linters_by_ft = {
  python = {"flake8"},
  javascript = {"eslint"}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
