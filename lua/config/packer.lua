local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }
    use({
        'decaycs/decay.nvim',
        as = 'decay',
    })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('phaazon/hop.nvim', { branch = "v2", })
    use('nvim-treesitter/nvim-treesitter-context')
    use('mbbill/undotree')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use { "ellisonleao/glow.nvim" }
    use { "terrortylor/nvim-comment" }
    use { 'nvim-lualine/lualine.nvim' }
    use { "nvim-tree/nvim-tree.lua" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "folke/zen-mode.nvim" }
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })
    use {
        'pianocomposer321/yabs.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { 'karb94/neoscroll.nvim' }
    use { 'WhoIsSethDaniel/mason-tool-installer.nvim' }
end)
