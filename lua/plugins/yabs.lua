return {
    'pianocomposer321/yabs.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local out = 'quickfix'

        require('telescope').load_extension('yabs')
        require('yabs'):setup({
            opts = {
                output_types = {
                    quickfix = {
                        open_on_run = 'always',
                    },
                },
            },
            languages = {
                python = {
                    default_task = "run",
                    tasks = {
                        run = {
                            command = "python %",
                            type = "shell",
                            output = output_format,
                        },
                        test = {
                            command = "python -m unittest",
                            type = "shell",
                            output = output_format,
                        },
                    },
                },
                rust = {
                    default_task = "run",
                    tasks = {
                        run = {
                            command = "cargo run",
                            type = "shell",
                            output = output_format,
                        },
                        test = {
                            command = "cargo test",
                            type = "shell",
                            output = output_format,
                        },
                        clippy = {
                            command = "cargo clippy",
                            type = "shell",
                            output = output_format,
                        },
                        format = {
                            command = "cargo fmt",
                            type = "shell",
                            output = output_format,
                        },
                    },
                },
                zig = {
                    default_task = "run",
                    tasks = {
                        run = {
                            command = "zig run",
                            type = "shell",
                            output = output_format,
                        },
                        test = {
                            command = "zig test",
                            type = "shell",
                            output = output_format,
                        },
                        build = {
                            command = "zig build",
                            type = "shell",
                            output = output_format,
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>rd", ":YabsDefaultTask<CR>")
        vim.keymap.set("n", "<leader>rr", ":YabsTask ")
        vim.keymap.set("n", "<leader>rs", ":Telescope yabs tasks<CR>")
    end
}
