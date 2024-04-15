return {
    'shortcuts/no-neck-pain.nvim',
    lazy = false,
    config = function()
        require("no-neck-pain").setup({
            width = 150,
        })
    end,
    keys = {
        { "<leader>Z", ":NoNeckPain<CR>" },
    },
}
