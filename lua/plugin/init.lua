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
    require('plugin/nvim-lspconfig').init(use)
    use('williamboman/nvim-lsp-installer')
    require('plugin/nvim-cmp').init(use)

    -- themes
    require('plugin/onedark')(use)
    require('plugin.telescope')(use)

    -- looks
    require('plugin/gitsigns')(use)
    require('plugin/lualine')(use)
    require('plugin/bufferline')(use)

    require('plugin/treesitter')(use)
    require('plugin/nvim-autopairs')(use)

    -- Grab all packages if we're setting up for the first time
    if packer_bootstrap then
        packer.sync()
    end
end)
-- NOTE: If :h <plugin> does not work, run :helptags ALL to add them

return packer_bootstrap
