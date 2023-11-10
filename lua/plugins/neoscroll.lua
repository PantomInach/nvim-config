return {
    'karb94/neoscroll.nvim',
    lazy = false,
    config = function()
        require('neoscroll').setup({
            -- mappings = { '<C-u>', '<C-d>' },
            mappings = {},
            hide_cursor = false,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            performance_mode = true,
            pre_hook = function() end,
            post_hook = function() end,
        })
        local t = {}
        t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
        t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
        require("neoscroll.config").set_mappings(t)
    end,
    keys = {}
}
