require("nvim_comment").setup({
    marker_padding = true,
    comment_emtpy = false,
    comment_empty_trim_whitspaces = true,
    create_mappings = true,
    line_mapping = "gcc",
    operator_mapping = "gc",
    comment_chunk_text_object = "ic",
    hook = nil,
})

vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", "/", ":'<,'>CommentToggle<CR>")
