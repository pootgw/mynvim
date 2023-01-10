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
    renderer = {
        full_name = true,
        group_empty = true,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    filters = {
        dotfiles = true,
    },
})
