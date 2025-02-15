return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        folds = false,
                    },
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            literature = "~/nextcloud/Literature",
                        }
                    }
                },

            }
        })
    end,
    keys = {
        { '<leader>nr', '<cmd>Neorg return<cr>' },
        { '<leader>nw', ':Neorg workspace ' },
    }
}
