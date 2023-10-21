return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            filters = {
                dotfiles = false,
            }
        })
    end,
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>" }
    },
}
