return function (packer)

    packer {
        "projekt0n/github-nvim-theme",
        config = function()
            require('github-theme').setup()
        end
    }

end
