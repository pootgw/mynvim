local nvim_lsp = require('lspconfig')
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
