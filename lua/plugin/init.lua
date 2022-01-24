local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)

    require('plugin/packer')(use)
    require('plugin/nvim-lspconfig').init(use)
    require('plugin/nvim-lsp-installer')(use)
    require('plugin/nvim-cmp').init(use)
    require('plugin/treesitter')(use)
    require('plugin/onedark')(use)
    --require('plugin/tokyodark')(use)
    --require('plugin/github-nvim-dark')(use)
    require('plugin/lualine')(use)
    require('plugin/bufferline')(use)
    require('plugin/diffview')(use)
    require('plugin/nvim-autopairs')(use)
    require('plugin/gitsigns')(use)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

