# nvim-config
This is my neovim config. Nothing more to say.

## Plugins
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)  
* [hop](https://github.com/phaazon/hop.nvim)
* [undotree](https://github.com/mbbill/undotree)
* [harpoon](https://github.com/ThePrimeagen/harpoon)
* [fugitive](https://github.com/tpope/vim-fugitive) 
* [glow](https://github.com/ellisonleao/glow.nvim)
* [comment](https://github.com/terrortylor/nvim-comment)
* [lualine](https://github.com/nvim-lualine/lualine.nvim)
* [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
* [yabs](https://github.com/pianocomposer321/yabs.nvim)
* [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
* [neoscroll](https://github.com/karb94/neoscroll.nvim)
* [oil](https://github.com/stevearc/oil.nvim)
* [trouble](https://github.com/folke/trouble.nvim)
* [no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim)
* [conform.nvim](https://github.com/stevearc/conform.nvim)
* [telescope-thesaurus.nvim](https://github.com/rafi/telescope-thesaurus.nvim)
* [mini.surround](https://github.com/echasnovski/mini.surround)

# Dependencies 
## General Dependencies 
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* make (for better fuzzy finding)
* [glow](https://github.com/charmbracelet/glow)

## Latex
### TexLab
It is used for compiling and forward searching.

For TexLab to compile the file a valid latex installation must be present.
The configured PDF viewer for forward searching is [zathura](https://github.com/pwmt/zathura).
Also, a zathura PDF engine must be installed. 

### Ltex
For grammar and spell checking [ltex](https://github.com/vigoux/ltex-ls.nvim) is used.

It is required that Java 11+ is installed to run this lsp.
All other dependencies will be installed automatically.

# Setup

# Additional Setup Steps
## Pylsp
For autocompletion and other lsp features of imported modules an option must be set extra. In `~/.local/share/nvim/mason/packages/python-lsp-server/venv/pyvenv.cnf` set `include-system-site-packages = false` to `true`.

Ensure the following pip packages are installed: `"python-lsp-server[all]", python-lsp-isort, pylsp-mypy, python-lsp-black`
