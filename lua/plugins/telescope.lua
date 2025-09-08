return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'rafi/telescope-thesaurus.nvim' },
    },
    config = function()
        require("telescope").setup({
            defaults = {},
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                },
                git_files = {
                    -- theme = "dropdown"
                },
                git_branches = {
                    -- theme = "dropdown",
                },
                live_grep = {
                    -- theme = "dropdown",
                },
                lsp_references = {
                    -- theme = "dropdown",
                },
                lsp_dynamic_workspace_symbols = {
                    -- theme = "dropdown",
                },
                diagnostics = {
                    -- theme = "dropdown",
                },
                current_buffer_fuzzy_find = {
                    -- theme = "dropdown",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                thesaurus = { provider = 'freedictionaryapi' },
            },
        })
        require("telescope").load_extension("fzf")
    end,
    keys = {
        { '<leader>fF', function() require("telescope.builtin").find_files() end, },
        { '<leader>ff', function() require("telescope.builtin").git_files() end, },
        { '<leader>fb', function() require("telescope.builtin").git_branches() end, },
        { "<leader>fW", function()
            require("telescope.builtin").live_grep {
                additionla_args = function(args)
                    return vim.list_extend(args, { "--hidden", "--no-ignore" })
                end
            }
        end },
        { '<leader>fw', function() require("telescope.builtin").live_grep() end, },
        { '<leader>fs', function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, },
        { 'gr',         function() require("telescope.builtin").lsp_references() end, }, -- Does not override default binding
        { "<leader>lR", function() require("telescope.builtin").lsp_references() end, },
        { "<leader>lD", function() require("telescope.builtin").diagnostics() end, },
        -- thesaurus
        { "<leader>lt", "<cmd>Telescope thesaurus lookup<CR>" }
    }
}
