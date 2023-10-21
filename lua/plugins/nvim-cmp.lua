return {
    'hrsh7th/nvim-cmp',
    config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = {
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        }

        cmp.setup({
            mapping = cmp_mappings
        })
    end
}
