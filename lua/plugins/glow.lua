return {
    'ellisonleao/glow.nvim',
    config = function()
        require("glow").setup({
            vim.keymap.set("n", "<leader>G", ":Glow<CR>")
        })
    end,
    keys = {
        { "<leader>G", ":Glow<CR>" }
    }
}
