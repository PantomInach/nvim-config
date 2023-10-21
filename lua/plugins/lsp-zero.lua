return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.preset("recommended")

        -- Done by mason-lspconfig
        -- lsp.ensure_installed({
        --     "rust_analyzer",
        --     "lua_ls",
        --     "pylsp",
        --     "ltex",
        --     "texlab",
        --     "zls",
        -- })
        -- -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        -- Python LSP setup
        lsp.configure('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        black = { enabled = true },
                        autopep8 = { enabled = true },
                        yapf = { enabled = true },
                        pylint = { enabled = true, executable = "pylint" },
                        ruff = { enabled = true },
                        pyflakes = { enabled = true },
                        pycodestyle = {
                            enabled = true,
                            ignore = ("E501"),
                        },
                        pylsp_mypy = { enabled = true, report_progress = true, live_mode = false },
                        jedi_completion = { fuzzy = true },
                        isort = { enabled = true }
                    }
                },
                formatCommand = { 'black' },
            }
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        -- local cmp_mappings = lsp.defaults.cmp_mappings({
        --     ["<CR>"] = cmp.mapping.confirm({ select = false }),
        --     ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        --     ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        -- })
        --
        -- Should be done by nvim-cmp
        -- lsp.setup_nvim_cmp({
        --     mapping = cmp_mappings
        -- })

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>lh", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>ll", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 2000,
            },
            servers = {
                ['lua_ls'] = { 'lua' },
                ['rust_analyzer'] = { 'rust' },
                ['pylsp'] = { 'python3' },
                ['zls'] = { 'zig' },
            },
        })

        lsp.setup()
    end
}
