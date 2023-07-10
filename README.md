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
* [tree](https://github.com/nvim-tree/nvim-tree.lua)
* [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
* [zen-mode](https://github.com/folke/zen-mode.nvim)
* [yabs](https://github.com/pianocomposer321/yabs.nvim)

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

### Scala Metals LSP
To use the scala metals lsp some extra things need to be done. 
Install:
* Java 8+
* cs
* sbt
* Run `cs install metals`

# Setup

## Init Packer
Install Packer with the following command

### Unix
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Windows
```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

## After installing Packer
Open nvim and run `:PackerSync` to download all plugins.
Close and reopen `nvim` so that TreeSitter and the LSP's can be setup.

# Additional Setup Steps
## Pylsp
For autocompletion and other lsp features of imported modules an option must be set extra.
In `~/.local/share/nvim/mason/packages/python-lsp-server/venv/pyvenv.cnf` set `include-system-site-packages = false` to `true`.
