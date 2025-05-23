return {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
    config = function()
        require("lsp-endhints").setup {
            icons = {
                type = "󰜁 ",
                parameter = "󰏪 ",
                offspec = " ", -- hint kind not defined in official LSP spec
                unknown = " ", -- hint kind is nil
            },
            label = {
                truncateAtChars = 30,
                padding = 1,
                marginLeft = 0,
                sameKindSeparator = ", ",
            },
            extmark = {
                priority = 50,
            },
            autoEnableHints = true,
        }
    end
}
