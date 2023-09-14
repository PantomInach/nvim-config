local out = "buffer"

require('telescope').load_extension('yabs')
require('yabs'):setup({
    languages = {
        python = {
            default_task = "run",
            tasks = {
                run = {
                    command = "python %",
                    type = "shell",
                    output = out,
                },
                test = {
                    command = "python -m unittest",
                    type = "shell",
                    output = out,
                },
            },
        },
        rust = {
            default_task = "run",
            tasks = {
                run = {
                    command = "cargo run",
                    type = "shell",
                    output = out,
                },
                test = {
                    command = "cargo test",
                    type = "shell",
                    output = out,
                },
                clippy = {
                    command = "cargo clippy",
                    type = "shell",
                    output = out,
                },
            },
        },
    },
    opts = {
        output_types = {
            quickfix = {
                open_on_run = 'always',
            },
        },
    },
})

vim.keymap.set("n", "<leader>rd", ":YabsDefaultTask<CR>")
vim.keymap.set("n", "<leader>rr", ":YabsTask ")
vim.keymap.set("n", "<leader>rs", ":Telescope yabs tasks<CR>")
