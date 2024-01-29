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
        { 'vigoux/ltex-ls.nvim' },
        { 'nvimtools/none-ls.nvim' },
    },
    config = function()
        local lsp = require('lsp-zero').preset('recommended')

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local border_opts = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- Up and down navigation
                ["<DOWN>"] = cmp.mapping.select_next_item(cmp_select),
                ["<UP>"] = cmp.mapping.select_prev_item(cmp_select),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            window = {
                completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts),
            }
        })

        lsp.preset("recommended")

        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 2000,
            },
            servers = {
                ['lua_ls'] = { 'lua' },
                ['rust_analyzer'] = { 'rust' },
                ['zls'] = { 'zig' },
            },
        })

        -- (Optional) Configure lua language server for neovim
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

        -- Python LSP setup
        -- lspconfig.python.setup({
        lsp.configure('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        black = { enabled = true },
                        autopep8 = { enabled = true },
                        yapf = { enabled = true },
                        pylint = { enabled = false },
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
                -- formatCommand = { 'black' },
            }
        })

        -- Rust LSP setup
        local rust_tool = require("rust-tools")
        rust_tool.setup()

        -- Latex LSPs setup
        lspconfig.texlab.setup({
            settings = {
                texlab = {
                    build = { onSave = true },
                    forwardSearch = { executable = "zathura", args = { "--synctex-forward", "%l:1:%f", "%p" } },
                },
            },
        })
        lspconfig.ltex.setup({})

        lsp.setup()

        -- Null-ls setup
        local null_ls = require('null-ls')
        local null_opts = lsp.build_options('null-ls', {})
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            on_attach = function(client, bufnr)
                null_opts.on_attach(client, bufnr)
                -- Format on save
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
            }
        })
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
