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
        { 'simrat39/rust-tools.nvim' },
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "rust_analyzer" },
        })
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
        lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

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

        -- Rust LSP setup
        local rust_tool = require("rust-tools")
        rust_tool.setup()

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

        lspconfig.texlab.setup({
            settings = {
                texlab = {
                    build = { onSave = true },
                    forwardSearch = { executable = "zathura", args = { "--synctex-forward", "%l:1:%f", "%p" } },
                },
            },
        })

        lsp.setup()
    end,
    keys = {
        -- TexLab
        { "<leader>mb", "<cmd>TexlabBuild<CR>" },
        { "<leader>mf", "<cmd>TexlabForward<CR>" },
        -- diagnostic
        { "gd",         function() vim.lsp.buf.definition() end, },
        { "K",          function() vim.lsp.buf.hover() end, },
        { "<leader>ld", function() vim.diagnostic.open_float() end, },
        { "<leader>lh", function() vim.diagnostic.goto_prev() end, },
        { "<leader>ll", function() vim.diagnostic.goto_next() end, },
        { "<leader>la", function() vim.lsp.buf.code_action() end, },
        { "<leader>lr", function() vim.lsp.buf.rename() end, },
        { "<leader>ls", function() vim.lsp.buf.signature_help() end, },
        { "<leader>lf", function() vim.lsp.buf.format() end, },
    },
}
