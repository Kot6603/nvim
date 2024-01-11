return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			disable_background = true,
		},
		config = function()
			local color = "rose-pine"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	-- tokyo night
	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = true,
	--   opts = { style = "moon" },
	-- },
}
