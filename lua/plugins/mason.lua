return {
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                "pylsp",
                "ltex",
                "texlab",
                "zls",
            }
        })
    end
}
