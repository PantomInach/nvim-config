require("nvim-tree").setup({
    sort_by = "case_sensitive",
    filters = {
        dotfiles = false,
    }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
