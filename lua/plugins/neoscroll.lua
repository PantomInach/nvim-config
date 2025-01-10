return {
    'karb94/neoscroll.nvim',
    lazy = false,
    config = function()
        local neoscroll = require("neoscroll")
        neoscroll.setup({
            mappings = { '<C-u>', '<C-d>' },
            hide_cursor = false,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            performance_mode = true,
            pre_hook = function() end,
            post_hook = function() end,
        })
    end,
    keys = {}
}
