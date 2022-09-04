local gitsigns = require('gitsigns')

gitsigns.setup{
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = false
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },

    on_attach = function(bufnr)
        local keymap_opts = { silent = true, noremap = true, buffer = bufnr }
        vim.keymap.set("n", "+", "<cmd>Gitsigns preview_hunk<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>hr", "<cmd>Gitsigns reset_hunk<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>hs", "<cmd>Gitsigns stage_hunk<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>br", "<cmd>Gitsigns reset_buffer<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>bs", "<cmd>Gitsigns stage_buffer<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>hn", "<cmd>Gitsigns next_hunk<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>hp", "<cmd>Gitsigns prev_hunk<CR>", keymap_opts)
        vim.keymap.set("n", "<Leader>bl", "<cmd>Gitsigns blame_line<CR>", keymap_opts)
        vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { default = true, link = "GitSignsDelete" })
    end,
}
