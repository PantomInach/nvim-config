return {
    'decaycs/decay.nvim',
    name = 'decay',
    config = function()
        local colors = require('decay.core').get_colors("decayce")
        local override = {
            FloatBorder = { fg = colors.forgroud, bg = colors.background },
        }
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
            nvim_tree = { contrast = true, },
            override = override
        }
        vim.cmd("colorscheme decayce")
    end
}
