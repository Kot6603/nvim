# My Configuration for Neovim

Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

## Installation
Run the following command in the `~/.config` directory:
```bash
git clone git@github.com:Kot6603/nvim.git
```

More information to be added

## Plugins
Plugins are managed using [lazy.nvim](https://github.com/folke/lazy.nvim)

Following plugins are installed:
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [rose-pine](https://github.com/rose-pine/neovim) (set to rose-pine-moon)
- [comment](https://github.com/numToStr/Comment.nvim)
- [conform](https://github.com/stevearc/conform.nvim)
- [fidget](https://github.com/j-hui/fidget.nvim)
    - for the lsp messages
- [fugitive](https://github.com/tpope/vim-fugitive)
    - the goated vim-git integration
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
    - I love theprimeagen
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [obsidian](https://github.com/epwalsh/obsidian.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
    - I love teej too
- [todo](https://github.com/folke/todo-comments.nvim)
    - I love folke too
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [zen-mode](https://github.com/folke/zen-mode.nvim)

LSP uses:
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason](https://github.com/williamboman/mason.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [luasnip](https://github.com/L3MON4D3/LuaSnip)

Within `init.lua` - general plugins without config
```lua
{ "nvim-lua/plenary.nvim" },
{ "christoomey/vim-tmux-navigator" },
{ "szw/vim-maximizer" },
{ "tpope/vim-surround" },
{ "mbbill/undotree" }, -- undo tree
{ "simrat39/symbols-outline.nvim" },
{ "windwp/nvim-ts-autotag" },
{ "theprimeagen/vim-be-good" },
{ "github/copilot.vim" },
```

### Plugins to Add:
- [ ] Add trouble integration

## Other Notes
- general keymaps are in `keymaps.lua`

## External Dependencies
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
