local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup{
    capabilities = require('plugin/nvim-cmp').capabilities(),
    on_attach = require('plugin/nvim-lspconfig').on_attach(),
}
--nvim_lsp.eslint.setup{}
