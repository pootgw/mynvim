local nvim_lsp = require('lspconfig')
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
