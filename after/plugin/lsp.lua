local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
    "rust_analyzer",
    "lua_ls",
    "pylsp",
    "ltex",
    "texlab",
})
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                jedi = {
                    enviroment = "/usr/bin/python3"
                }
            }
        }
    }
})


local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<CR>"] = cmp.mapping.confirm({ select = false }),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

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

lsp.setup()
