require("telescope").setup({
    defaults = {},
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    extensions = {},
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fW', function()
    require("telescope.builtin").live_grep {
        additionla_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
        end
    }
end)
