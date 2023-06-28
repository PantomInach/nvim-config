vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex )

-- Move visualized blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copying and deleting into system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- Better saving
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>W", "<cmd>w!<cr>")

-- Move and resize windows
vim.keymap.set("n", "<S-Left>", "<C-w>h")
vim.keymap.set("n", "<S-Right>", "<C-w>l")
vim.keymap.set("n", "<S-Down>", "<C-w>j")
vim.keymap.set("n", "<S-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Indent in visual mode with tab
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")
