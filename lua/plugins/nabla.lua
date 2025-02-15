return {
    'jbyuki/nabla.nvim',
    config = function()
    end,
    keys = {
        { '<leader>L', function() require("nabla").popup({ border = 'double' }) end },
    }
}
