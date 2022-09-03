local nvim_lsp = require('lspconfig')

--   for golang
nvim_lsp.gopls.setup{
    cmd = {'gopls', 'serve'},
    -- for postfix snippets and analyzers
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    capabilities = require('plugin/nvim-cmp').capabilities(),
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}

-- for php
nvim_lsp.intelephense.setup{
    settings = {
        intelephense = {
            environment = {
                documentRoot = '',
                includePaths = {
                }
            };
            files = {
                associations = {
                    '*.php'
                },
                exclude = {
                    "**/.git/**",
                    "**/.svn/**",
                    "**/.hg/**",
                    "**/CVS/**",
                    "**/.DS_Store/**",
                    "**/vendor/**/{Tests,tests}/**"
                },
                maxSize = 5000000
            };
        };
    },

    capabilities = require('plugin/nvim-cmp').capabilities(),
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}

-- for js
nvim_lsp.tsserver.setup{
    capabilities = require('plugin/nvim-cmp').capabilities(),
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}

-- for lua
nvim_lsp.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    capabilities = require('plugin/nvim-cmp').capabilities(),
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}
