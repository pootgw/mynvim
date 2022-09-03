-- Essentials
vim.g.mapleader = ","
vim.g.bulitin_lsp = true

require('plugin')
require('lang/intelephense')
require('lang/gopls')
require('lang/js')
require('lang/lua')

-- Behaviors
vim.opt.belloff = "all" -- NO BELLS!
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- ins-completion how vsnip likes it
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "nosplit" -- preview %s commands live as I type
vim.opt.undofile = true -- keep track of my 'undo's between sessions
vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
vim.opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
vim.opt.mouse = "nv" -- use mouse in normal, visual modes

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <Tab> behaves as 4 spaces when editing

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme onedark")

-- Look and feel
vim.opt.number = true -- numbers?
vim.opt.relativenumber = false -- no numbers?
vim.opt.signcolumn = "auto" -- show the sign column if necessary
vim.opt.cursorline = false -- don't highlight current line
vim.opt.list = true -- show list chars
--vim.opt.listchars = {
--    -- these list chars
--    tab = "<->",
--    nbsp = "␣",
--    extends = "…",
--    precedes = "…",
--    trail = "·",
--    multispace = "·", -- show chars if I have multiple spaces between text
--    leadmultispace = " ", -- ...but don't show any when they're at the start
--}
vim.opt.scrolloff = 10 -- padding between cursor and top/bottom of window
vim.opt.foldlevel = 0 -- allow folding the whole way down
vim.opt.foldlevelstart = 99 -- open files with all folds open
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer splitting below
vim.opt.wrap = false -- don't wrap my text
vim.opt.textwidth = 120 -- wrap here for comments by default
vim.opt.cursorline = true -- hightlight line cursor is on
vim.opt.laststatus = 3 -- single global statusline

-- Searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- unless I use caps
vim.opt.hlsearch = true -- highlight matching text
vim.opt.incsearch = true -- update results while I type


local util = require('util')
util.noremap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
util.noremap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
util.noremap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
util.noremap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
util.noremap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
util.noremap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
util.noremap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
util.noremap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
util.noremap('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')

util.noremap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
util.noremap('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>')
util.noremap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>')
util.noremap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>')
