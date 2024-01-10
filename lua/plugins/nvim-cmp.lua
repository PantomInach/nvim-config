return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = {
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<DOWN>"] = cmp.mapping.select_next_item(cmp_select),
            ["<UP>"] = cmp.mapping.select_prev_item(cmp_select),
        }

        local border_opts = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }

        cmp.setup({
            mapping = cmp_mappings,
            window = {
                completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts),
            }
        })
    end,
}
