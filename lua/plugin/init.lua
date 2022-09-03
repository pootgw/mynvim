-- Bootstrap packer if necessary
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Init setup
vim.cmd("packadd packer.nvim") -- load packer
local packer = require("packer")

packer.init({
    auto_reload_compiled = true,
})

packer.startup(function(use)
    -- Strictly required
    use("wbthomason/packer.nvim") -- let packer manage itself
    use("nvim-lua/popup.nvim") -- popup windows
    use("nvim-lua/plenary.nvim") -- utility functions

    -- Essentials
    use({
        "nvim-telescope/telescope.nvim", -- fuzzy find ALL the things
        config = function() require("plugin.config.telescope") end,
    })
    use({
        'windwp/nvim-autopairs',
        config = function() require("plugin.config.autopairs") end,
    })
    use("tpope/vim-surround")
    use({
        "hrsh7th/nvim-cmp", -- autocomplete
        requires = {
            -- completion sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-path",
            'hrsh7th/cmp-cmdline',

            -- complements
            "onsails/lspkind-nvim", -- add the nice source + completion item kind to the menu
        },
        config = function() require("plugin.config.cmp") end,
        module = "cmp",
    })

    -- lsp
    use('neovim/nvim-lspconfig')
    use("jose-elias-alvarez/null-ls.nvim")
    use('williamboman/nvim-lsp-installer')

    -- looks
    use({
        'lewis6991/gitsigns.nvim',
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("plugin.config.gitsigns") end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require("plugin.config.lualine") end,
    })
    use({
        "nvim-telescope/telescope-ui-select.nvim", -- Use telescope to override vim.ui.select
        requires = { "nvim-telescope/telescope.nvim" },
    })
    use({
        "catppuccin/nvim", -- the lua colorscheme
        as = "catppuccin",
        config = function() require("plugin.config.catppuccin") end,
        run = ":CatppuccinCompile",
    })
    use({
        'akinsho/bufferline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require("plugin.config.bufferline") end,
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require("plugin.config.treesitter") end,
    })

    -- Grab all packages if we're setting up for the first time
    if packer_bootstrap then
        packer.sync()
    end
end)
-- NOTE: If :h <plugin> does not work, run :helptags ALL to add them

return packer_bootstrap
