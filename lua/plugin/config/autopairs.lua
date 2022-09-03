local autopairs = require("nvim-autopairs")

autopairs.setup{
    map_cr = true, -- send closing symbol to its own line
    check_ts = true, -- use treesitter
}
