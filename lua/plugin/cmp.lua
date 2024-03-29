local cmp = require("cmp")
if not cmp then return end

cmp.setup({
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    },
    sources = cmp.config.sources({
        { name = "vsnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp", max_item_count = 30 }, -- tsserver likes to send back _everything_
        { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "buffer", keyword_length = 3 }, -- don't complete from buffer right away
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-h>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Manual }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true, -- use first result if none explicitly selected
        }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    preselect = cmp.PreselectMode.None,
    formatting = {
        -- Show where the completion opts are coming from
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                vsnip = "[vsnip]",
                nvim_lua = "[nvim]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                buffer = "[buffer]",
                nvim_lsp_signature_help = "[param]",
            },
        }),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
