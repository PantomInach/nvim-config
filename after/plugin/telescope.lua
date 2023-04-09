require("telescope").setup({
    defaults = {},
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        git_files = {
            theme = "dropdown"
        },
        git_branches = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        lsp_references = {
            theme = "dropdown",
        },
        lsp_dynamic_workspace_symbols = {
            theme = "dropdown",
        },
        diagnostics = {
            theme = "dropdown",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    },
})
require("telescope").load_extension("fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fW', function()
    require("telescope.builtin").live_grep {
        additionla_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
        end
    }
end)
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set("n", "<leader>lR", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>lw", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>lD", builtin.diagnostics, {})
