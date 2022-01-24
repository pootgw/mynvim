local nvim_lsp = require('lspconfig')
nvim_lsp.gopls.setup{
    cmd = {'gopls'},
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
