return {
    'decaycs/decay.nvim',
    name = 'decay',
    lazy = false,
    config = function()
        local colors_decayce = require('decay.core').get_colors("decayce")
        -- require("decay").setup {
        --     style = "default",
        --     nvim_tree = { contrast = true, },
        -- }
        -- require("decay").setup {
        --     style = "dark",
        --     nvim_tree = { contrast = true, },
        -- }
        -- require("decay").setup {
        --     style = "cosmic",
        --     nvim_tree = { contrast = true, },
        -- }
        require("decay").setup {
            style = "decayce",
            -- nvim_tree = { contrast = true, },
            override = {
                FloatBorder = { fg = colors_decayce.forgroud, bg = colors_decayce.background },
            }
        }
    end
}
