return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        { 'mason-org/mason.nvim', opts = {}, lazy = false },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim',    opts = {} },
        'saghen/blink.cmp',
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                ---@param client vim.lsp.Client
                ---@param method vim.lsp.protocol.Method
                ---@param bufnr? integer some lsp support methods only in specific files
                ---@return boolean
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has 'nvim-0.11' == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
                        { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                --     map('<leader>th', function()
                --         vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                --     end, '[T]oggle Inlay [H]ints')
                -- end
            end,
        })
        vim.diagnostic.config {
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
            } or {},
            virtual_text = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local servers = {
            rust_analyzer = {
                settings = {
                    inlayHints = { closureCaptureHints = { enable = false } }
                },
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            },
            julials = {},
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            black = { enabled = true },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            pylint = { enabled = true },
                            ruff = { enabled = false },
                            pyflakes = { enabled = true },
                            pycodestyle = {
                                enabled = true,
                                ignore = { "E501", "W503" },
                            },
                            pylsp_mypy = { enabled = true, report_progress = true, live_mode = false },
                            jedi_completion = { fuzzy = true },
                            isort = { enabled = true }
                        }
                    },
                }
            },
            texlab = {
                settings = {
                    texlab = {
                        build = { onSave = true },
                        forwardSearch = { executable = "zathura", args = { "--synctex-forward", "%l:1:%f", "%p" } },
                    },
                },
            },
            ltex = {},
            zls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
            'rstcheck',
            'mypy',
            'black',
            -- 'latexindent',
            -- 'ltex-ls-plus'
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        -- Installed LSPs are configured and enabled automatically with mason-lspconfig
        -- The loop below is for overriding the default configuration of LSPs with the ones in the servers table
        for server_name, config in pairs(servers) do
            vim.lsp.config(server_name, config)
            vim.lsp.enable(server_name)
        end
    end,
    keys = {
        -- TexLab
        { "<leader>mb", "<cmd>LspTexlabBuild<CR>" },
        { "<leader>mf", "<cmd>LspTexlabForward<CR>" },
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
