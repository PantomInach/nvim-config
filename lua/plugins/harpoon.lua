return {
    'theprimeagen/harpoon',
    lazy = false,
    config = function()
        require("harpoon").setup({
            save_on_change = true,
            enter_on_sendcmd = true,
            tmux_autoclose_windows = false,
            tabline = false,
        })
    end,
    keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end, },
        { "<leader>A", function() require("harpoon.mark").clear_all() end, },
        { "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, },
        { "<C-h>",     function() require("harpoon.ui").nav_prev() end, },
        { "<C-l>",     function() require("harpoon.ui").nav_next() end, },
        { "<leader>1", function() require("harpoon.ui").nav_file(1) end, },
        { "<leader>2", function() require("harpoon.ui").nav_file(2) end, },
        { "<leader>3", function() require("harpoon.ui").nav_file(3) end, },
        { "<leader>4", function() require("harpoon.ui").nav_file(4) end, },
        { "<leader>5", function() require("harpoon.ui").nav_file(5) end, },
        { "<leader>6", function() require("harpoon.ui").nav_file(6) end, },
        { "<leader>7", function() require("harpoon.ui").nav_file(7) end, },
        { "<leader>8", function() require("harpoon.ui").nav_file(8) end, },
        { "<leader>9", function() require("harpoon.ui").nav_file(9) end, },
        { "<leader>0", function() require("harpoon.ui").nav_file(10) end, },
    },
}
