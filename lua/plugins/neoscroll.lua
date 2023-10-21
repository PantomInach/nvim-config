return {
    'karb94/neoscroll.nvim',
    options = function()
        require('neoscroll').setup({
            mappings = { '<C-u>', '<C-d>' },
            hide_cursor = false,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            performance_mode = true,
        })
    end
}
