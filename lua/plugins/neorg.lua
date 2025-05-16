return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-neorg/neorg-telescope' },
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
                            phd = "~/nextcloud/Notes/phd",
                        }
                    }
                },
                ["core.integrations.telescope"] = {
                    config = {
                        insert_file_link = { show_title_preview = true, },
                    },
                },

            }
        })
    end,
    keys = {
        { '<leader>nr', '<cmd>Neorg return<cr>' },
        { '<leader>nw', '<Plug>(neorg.telescope.switch_workspace)' },
        { '<leader>nf', '<Plug>(neorg.telescope.find_norg_files)' },
        { '<leader>nl', '<Plug>(neorg.telescope.insert_link)' },
        { '<leader>nL', '<Plug>(neorg.telescope.insert_file_link)' },
    }
}
