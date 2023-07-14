local config_path = vim.fn.stdpath("config")
-- local config_path = "/home/aaron/.config/nvim"
-- local config_file = require(config_path .. ".options")
local config_file = dofile(config_path .. "/options.lua")
-- local config_file = require("options")
require("obsidian").setup({
    dir = config_file.obsidian_vault_location,

    daily_notes = {
        date_format = "%d-%m-%Y",
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return tostring(os.time()) .. "-" .. suffix
    end,

    disable_frontmatter = false,

    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,
    use_advanced_uri = true,

    open_app_foreground = false,
    finder = "telescope.nvim",
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
})


vim.keymap.set("n", "<leader>og", ":ObsidianFollowLink<CR>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>of", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>os", ":ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>")

local tmux = require("harpoon.tmux")
vim.keymap.set("n", "<leader>oO", function() tmux.sendCommand(0, "cd " .. config_file.obsidian_vault_location .. " && nvim && exit\n" ) end)
