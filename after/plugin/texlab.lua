local lspconfig = require('lspconfig')

lspconfig.texlab.setup({
    settings = {
        texlab = {
            build = { onSave = true },
            forwardSearch = { executable = "zathura", args = { "--synctex-forward", "%l:1:%f", "%p" } },
        },
    },
})

vim.keymap.set("n", "<leader>mb", "<cmd>TexlabBuild<CR>")
vim.keymap.set("n", "<leader>mf", "<cmd>TexlabForward<CR>")
