return {
	{ "nvim-lua/plenary.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "szw/vim-maximizer" },
	{ "tpope/vim-surround" },
	{ "mbbill/undotree" }, -- undo tree
	{ "simrat39/symbols-outline.nvim" },
}

--[[
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

	-- git
	{ "kdheepak/lazygit.nvim" },
	{ "lewis6991/gitsigns.nvim" },

	-- nice to have
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "ThePrimeagen/refactoring.nvim" },

	-- { "vim-scripts/ReplaceWithRegister" },

})

-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
]]
--
