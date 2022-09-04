local aerial = require("aerial")

aerial.setup({
    backends = { "treesitter" },
    max_width = 40,
    min_width = 20,
    close_behavior = "close",
    manage_folds = false,
    link_folds_to_tree = false,
    link_tree_to_folds = false,
    treesitter = {
        update_delay = 100,
    },
})
