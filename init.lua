---------------------------------------------------------------
-- => Packer 
---------------------------------------------------------------

require('plugin')

---------------------------------------------------------------
-- => General
---------------------------------------------------------------

-- Sets how many lines of history VIM has to remember
vim.cmd 'set history=500'

-- Enable filetype plugins
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'

-- Set to auto read when a file is changed from the outside
vim.cmd 'set autoread'
-- au FocusGained,BufEnter * checktime

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ','

-- Fast saving
-- nmap <leader>w :w!<cr>

-- :W sudo saves the file
-- (useful for handling the permission-denied error)
-- command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

---------------------------------------------------------------
-- => VIM user interface
---------------------------------------------------------------
-- Set 7 lines to the cursor - when moving vertically using j/k
vim.cmd 'set so=7'

-- Always show current position
vim.cmd 'set ruler'

-- Height of the command bar
vim.cmd 'set cmdheight=1'

-- A buffer becomes hidden when it is abandoned
vim.cmd 'set hid'

-- Configure backspace so it acts as it should act
--set backspace=eol,start,indent
vim.opt.backspace = 'indent,eol,start'
vim.cmd 'set whichwrap+=<,>,h,l'

-- Ignore case when searching
vim.opt.ignorecase = true

-- When searching try to be smart about cases
vim.opt.smartcase = true

-- Highlight search results
vim.cmd 'set hlsearch'

-- Makes search act like search in modern browsers
vim.opt.incsearch = true

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true
-- How many tenths of a second to blink when matching brackets
vim.cmd 'set mat=2'

-- No annoying sound on errors
vim.cmd 'set noerrorbells'
vim.cmd 'set novisualbell'
vim.cmd 'set t_vb='
vim.cmd 'set tm=500'

-- Add a bit extra margin to the left
vim.cmd 'set foldcolumn=1'

---------------------------------------------------------------
-- => Colors and Fonts
---------------------------------------------------------------
-- Enable syntax highlighting
vim.cmd 'syntax on'

vim.cmd 'set termguicolors'
vim.cmd 'colorscheme onedark'

vim.cmd 'set background=dark'

-- Set utf8 as standard encoding and en_US as the standard language
vim.cmd 'set encoding=utf8'

-- Use Unix as the standard file type
vim.cmd 'set ffs=unix,dos,mac'

---------------------------------------------------------------
-- => Files, backups and undo
---------------------------------------------------------------
-- Turn backup off, since most stuff is in SVN, git etc. anyway...
vim.cmd 'set nobackup'
vim.cmd 'set nowb'
vim.cmd 'set noswapfile'


---------------------------------------------------------------
-- => Text, tab and indent related
---------------------------------------------------------------
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Be smart when using tabs ;)
vim.opt.smarttab = true

-- 1 tab == 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Linebreak on 500 characters
vim.cmd 'set lbr'
vim.cmd 'set tw=500'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd 'set wrap'

vim.opt.foldenable = false
vim.opt.list = true
vim.opt.shiftround = true
vim.opt.modeline = true
vim.opt.enc = 'utf-8'
vim.opt.fenc = 'utf-8'
vim.opt.conceallevel = 1


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
