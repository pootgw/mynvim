return function(packer)
    packer {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }
end
