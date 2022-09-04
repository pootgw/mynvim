local nvimtree = require("nvim-tree")

nvimtree.setup({
    hijack_cursor = true,
    view = {
        adaptive_size = true,
        width = 30,
        side = "left",
    },
    git = {
        enable = true, -- show git statuses
        ignore = false, -- still show .gitignored files
    },
})
