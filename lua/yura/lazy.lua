local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jay-babu/mason-nvim-dap.nvim" },

			-- null-ls
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jayp0521/mason-null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip", version = "2.*" },
			{ "honza/vim-snippets" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	-- navigation
	{
		"kyazdani42/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "simrat39/symbols-outline.nvim" },

	-- git
	{ "kdheepak/lazygit.nvim" },
	{ "lewis6991/gitsigns.nvim" },

	-- nice to have
	{ "numToStr/Comment.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "ThePrimeagen/refactoring.nvim" },

	-- what i had before
	{ "nvim-lua/plenary.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "szw/vim-maximizer" },

	{ "tpope/vim-surround" },
	-- { "vim-scripts/ReplaceWithRegister" },
	{ "nvim-lualine/lualine.nvim" }, -- status line
	{ "mbbill/undotree" }, -- undo tree

	-- color
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
})

-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
