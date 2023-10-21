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

        vim.keymap.set("n", "<C-f>", ":HopWord<cr>")
        vim.keymap.set("n", "<C-p>", ":HopPattern<cr>")
    end
}
