return {
    'ellisonleao/glow.nvim',
    config = function()
        require("glow").setup()
    end,
    keys = {
        { "<leader>G", ":Glow<CR>" }
    }
}
