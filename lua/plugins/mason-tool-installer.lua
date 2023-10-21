return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
        require('mason-tool-installer').setup({
            ensure_installed = {
                'mypy',
                'rstcheck',
                'black',
                'rustfmt',
            },
            auto_update = false,
            run_on_start = true,
            debounce_hours = 5,
        })
    end
}
