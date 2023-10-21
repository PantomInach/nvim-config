return {
    'phaazon/hop.nvim',
    branch = "v2",
    config = function()
        require("hop").setup({
            keys = "abcdefghijklmnopqrstuvwxyz",
            quit_key = "<SPC>",
            jump_on_sole_occurence = true,
            case_sensitive = false,
            multi_window = false,
            hint_offset = 0,
        })
    end,
    keys = {
        { "<C-f>", ":HopWord<CR>" },
        { "<C-p>", ":HopPattern<CR>" },
    }
}
