require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'pyright',
        'tsserver',
    }
})

-- Add additional capabilities supported by nvim-cmp
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
local util = require("lspconfig/util")

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,
})

-- Setup language servers.
-- lspconfig.pyright.setup({
--     root_dir = function(fname)
--                 return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
--                     util.path.dirname(fname)
--                 end,
--     capabilities = capabilities,
    -- settings = {
        -- disableLanguageServices = true,
        -- typeCheckingMode = "off",
        -- reportUndefinedVariable = "none",
        -- reportMissingImports = "none",
        -- reportMissingModuleSource = "none",
        -- disableOrganizeImports = true,
    -- }
-- })

-- lspconfig.tsserver.setup {
--     capabilities = capabilities
-- }

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
    vim.keymap.set("n", "<leader>gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})


-- nvim-lint config
-- require("lint").linters_by_ft = {
--   python = {"flake8"},
--   javascript = {"eslint"}
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require('cmp')
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
        { name = 'path' },
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

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

vim.diagnostic.config({
    virtual_text = true
})

