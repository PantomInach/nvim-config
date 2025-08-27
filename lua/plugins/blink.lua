return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'mikavilpas/blink-ripgrep.nvim',
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'none',
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 50,
                window = { border = "single" }
            },
            menu = { border = "single" }
        },
        signature = { enabled = true, window = { show_documentation = true } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
            providers = {
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {
                        prefix_min_len = 3,
                        context_size = 5,
                        max_filesize = "1M",
                        project_root_marker = ".git",
                        project_root_fallback = true,
                        search_casing = "--ignore-case",
                        additional_rg_options = {},
                        fallback_to_regex_highlighting = true,
                        ignore_paths = {},
                        additional_paths = {},
                        toggles = {
                            on_off = nil,
                        },
                        future_features = {
                            backend = {
                                use = "ripgrep",
                            },
                        },
                        debug = false,
                    },
                }
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
