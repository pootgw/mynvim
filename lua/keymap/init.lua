-- Mapping helper
local util = require("util")

-- Essentials
util.noremap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
util.noremap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
util.noremap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
util.noremap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
util.noremap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
util.noremap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
util.noremap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
util.noremap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
util.noremap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')
util.noremap('n', '<leader>bd', '<cmd>bd<CR>')

-- Movemint
util.noremap("n", "<C-j>", "<C-w>j")
util.noremap("n", "<C-h>", "<C-w>h")
util.noremap("n", "<C-k>", "<C-w>k")
util.noremap("n", "<C-l>", "<C-w>l")

-- Move without firing 'BufEnter' autocommands
--mapper("n", "<M-j>", ":noautocmd wincmd j<CR>")
--mapper("n", "<M-h>", ":noautocmd wincmd h<CR>")
--mapper("n", "<M-k>", ":noautocmd wincmd k<CR>")
--mapper("n", "<M-l>", ":noautocmd wincmd l<CR>")
--
-- Term
util.noremap("t", "<Esc><Esc>", [[<C-\><C-n>]])
util.noremap("t", "<C-j>", [[<C-\><C-n><C-w>j]])
util.noremap("t", "<C-h>", [[<C-\><C-n><C-w>h]])
util.noremap("t", "<C-k>", [[<C-\><C-n><C-w>k]])
util.noremap("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Other basics
--mapper("n", "<Down>", [["pdd"pp]]) -- move line down
--mapper("n", "<Up>", [["pddk"pP]]) -- move line up
--mapper("n", "<C-e>", "3<C-e>") -- scroll down more quickly
--mapper("n", "<C-y>", "3<C-y>") -- scroll up more quickly
--mapper("n", "<Leader>bn", ":bn<CR>") -- next buffer
--mapper("n", "<Leader>bp", ":bp<CR>") -- prev buffer
--mapper("n", "<Leader>bd", ":bp | bd #<CR>") -- delete the current buffer
--mapper("n", "+", "=") -- new format mapping
--mapper("n", "<Leader>nn", ":set number!<CR>") -- toggle line numbers

-- Things that require plugins
util.noremap("n", "<Leader>nt", ":NvimTreeToggle<CR>") -- toggle file browser in left split
util.noremap("n", "<Leader>nf", ":NvimTreeFindFile<CR>") -- open file browser in left split with the current file focused
util.noremap("n", "<Leader>nr", ":NvimTreeRefresh<CR>") -- refresh file browser contents
util.noremap("n", "<Leader>z", ":call ToggleFocus()<CR>") -- toggle focus on current window
--util.noremap("n", "<Leader>tn", ":call termcmd#vert()<CR>") -- open new term in vertical split
--util.noremap("n", "<Leader>ts", ":call termcmd#horiz()<CR>") -- open new term in horizontal split
util.noremap("n", "<Leader>ou", "<cmd>AerialToggle!<CR>") -- toggle code outline, powered by tree-sitter
--util.noremap("n", "<Leader>rr", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:e<CR>") -- restart language servers

-- Telescope integration
util.noremap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>") -- search all files, respecting .gitignore if one exists
util.noremap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>") -- search open buffers
util.noremap("n", "<Leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>") -- search lines in current buffer
util.noremap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>") -- search all lines in project
util.noremap("n", "<Leader>fr", "<cmd>Telescope lsp_references<CR>") -- search references to symbol under cursor
util.noremap("n", "<Leader>co", "<cmd>Telescope colorscheme<CR>") -- colorschemes
util.noremap("n", "<Leader>gc", "<cmd>Telescope git_branches<CR>") -- checkout different branches
util.noremap("n", "<Leader>re", "<cmd>Telescope git_commits<CR>") -- checkout commits; <CR> to checkout, <C-r>[m, s, h] to reset [mixed, soft, hard]


-- jump to items in quickfix list
--mapper("n", "<Leader>qf", function()
--    -- open picker at bottom of window to match where the quickfix list already is
--    telescope_builtin.quickfix(require("telescope.themes").get_ivy())
--end)

-- Git things
util.noremap("n", "<Leader>gs", ":tab Git<CR>") -- `git status` in a new tab to save screen real estate
util.noremap("n", "<Leader>gd", "<cmd>Gdiffsplit<CR>") -- open a split diffing the current file
