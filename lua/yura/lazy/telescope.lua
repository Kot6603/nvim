return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			-- configure telescope
			telescope.setup({
				-- configure custom mappings
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
				},
			})
			telescope.load_extension("fzf")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
