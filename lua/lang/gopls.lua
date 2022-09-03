local nvim_lsp = require('lspconfig')
local nvim_util = require("lspconfig/util")
nvim_lsp.gopls.setup{
    cmd = {'gopls', 'serve'},
    -- for postfix snippets and analyzers
    capabilities = require('plugin/nvim-cmp').capabilities(),
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
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}
