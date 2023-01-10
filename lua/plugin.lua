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

    -- lsp
    use('neovim/nvim-lspconfig')
    use('williamboman/nvim-lsp-installer')

    -- completion
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
        config = function() require("plugin.cmp") end,
        module = "cmp",
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("plugin.null-ls") end,
    })

    -- telescope
    use({
        "nvim-telescope/telescope.nvim", -- fuzzy find ALL the things
        config = function() require("plugin.telescope") end,
    })
    use({
        "nvim-telescope/telescope-ui-select.nvim", -- Use telescope to override vim.ui.select
        requires = { "nvim-telescope/telescope.nvim" },
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim", -- fzf-like searching for telescope
        run = "make",
    })
    use({
        "nvim-telescope/telescope-dap.nvim", -- telescope picker for dap actions/configuraitons
        requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
    })

    -- debug
    use({
        'mfussenegger/nvim-dap',
    })
    use({
        'leoluz/nvim-dap-go',
        config = function() require("plugin.dap-go") end,
    })
    use ({ 
        "rcarriga/nvim-dap-ui", 
        config = function() require("plugin.dap-ui") end,
    })
    use ({
        'theHamsta/nvim-dap-virtual-text',
        config = function() require("plugin.dap-virtual-text") end,
    })

    -- quick tools
    use("tpope/vim-surround")
    use({
        'windwp/nvim-autopairs',
        config = function() require("plugin.autopairs") end,
    })
    use({
        "anuvyklack/hydra.nvim", -- custom "modes"
        config = function() require("plugin.hydra") end,
    })
    use({
        "godlygeek/tabular", -- line it up
        cmd = "Tab",
    })

    -- beauty
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require("plugin.lualine") end,
    })
    use({
        'akinsho/bufferline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require("plugin.bufferline") end,
    })

    -- colorscheme
    use({
        "catppuccin/nvim", -- the lua colorscheme
        as = "catppuccin",
        config = function() require("plugin.catppuccin") end,
        run = ":CatppuccinCompile",
    })
    use({
        "folke/tokyonight.nvim",
        config = function() require("plugin.tokyonight") end,
    })

    -- use({
    --     'nvim-treesitter/nvim-treesitter',
    --     run = ':TSUpdate',
    --     config = function() require("plugin.treesitter") end,
    -- })

    -- like ide ?
    use({
        "kyazdani42/nvim-tree.lua", -- no more netrw
        config = function() require("plugin.tree") end,
        cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
    })
    use({
        "stevearc/aerial.nvim", -- code outline
        config = function() require("plugin.aerial") end,
    })

    -- git
    use({
        "tpope/vim-fugitive", -- git integration
        cmd = { "Git", "Gvdiffsplit" },
    })
    use({
        'lewis6991/gitsigns.nvim',
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("plugin.gitsigns") end,
    })

    -- Grab all packages if we're setting up for the first time
    if packer_bootstrap then
        packer.sync()
    end
end)
-- NOTE: If :h <plugin> does not work, run :helptags ALL to add them

return packer_bootstrap
