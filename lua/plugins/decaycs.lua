return {
    'decaycs/decay.nvim',
    name = 'decay',
    config = function()
        require("decay").setup {
            style = "default",
            nvim_tree = { contrast = true, },
        }
        require("decay").setup {
            style = "dark",
            nvim_tree = { contrast = true, },
        }
        require("decay").setup {
            style = "cosmic",
            nvim_tree = { contrast = true, },
        }
        require("decay").setup {
            style = "decayce",
            nvim_tree = { contrast = true, },
        }
        vim.cmd("colorscheme dark-decay")
    end
}
