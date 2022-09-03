local nvim_lsp = require('lspconfig')

local custom_attach = function(client, bufnr)
	local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
	-- LSP mappings (only apply when LSP client attached)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
	--vim.keymap.set("n", "gr", vim.lsp.buf.rename, keymap_opts)

	-- diagnostics
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.open_float, keymap_opts) -- diagnostic(s) on current line
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, keymap_opts) -- move to next diagnostic in buffer
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, keymap_opts) -- move to prev diagnostic in buffer
	vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, keymap_opts) -- show all buffer diagnostics in qflist
	vim.keymap.set("n", "H", vim.lsp.buf.code_action, keymap_opts) -- code actions (handled by telescope-ui-select)
--	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, keymap_opts) -- manual formatting, because sometimes they just decide to stop working

	-- use omnifunc
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr"

	-- format on save
	--local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
	--vim.api.nvim_create_autocmd("BufWritePre", {
	--	group = augroup,
	--	buffer = bufnr,
	--	callback = function()
	--		vim.lsp.buf.format({
	--			filter = function(this_client)
	--				local lang = vim.opt.filetype:get()
	--				if lang == "typescript" then return this_client.name ~= "tsserver" end -- disable tsserver formatting, it doesn't respect eslintrc
	--			end,
	--		})
	--	end,
	--})
end

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
    on_attach = custom_attach,
    --capabilities = require('plugin/nvim-cmp').capabilities(),
    --on_attach = require('plugin/nvim-lspconfig').on_attach(),
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

    on_attach = custom_attach,
    --capabilities = require('plugin/nvim-cmp').capabilities(),
    --on_attach = require('plugin/nvim-lspconfig').on_attach(),
}

-- for js
nvim_lsp.tsserver.setup{
    on_attach = custom_attach,
    --capabilities = require('plugin/nvim-cmp').capabilities(),
    --on_attach = require('plugin/nvim-lspconfig').on_attach(),
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
    on_attach = custom_attach,
    --capabilities = require('plugin/nvim-cmp').capabilities(),
    --on_attach = require('plugin/nvim-lspconfig').on_attach(),
}
