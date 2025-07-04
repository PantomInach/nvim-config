return {
    'pianocomposer321/yabs.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local output_format = 'quickfix'

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
                julia = {
                    default_task = "run",
                    tasks = {
                        run = {
                            command = "julia %",
                            type = "shell",
                            output = output_format,
                        }
                    }
                },
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
                        bench = {
                            command = "cargo bench",
                            type = "shell",
                            output = output_format,
                        },
                        run_release = {
                            command = "cargo run --release",
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
    end,
    keys = {
        { "<leader>rd", ":YabsDefaultTask<CR>" },
        { "<leader>rr", ":YabsTask<CR>" },
        { "<leader>rs", ":Telescope yabs tasks<CR>" },
    }
}
