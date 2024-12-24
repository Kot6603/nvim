return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			-- configure telescope
			telescope.setup({
				-- configure custom mappings
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
				},
			})

			-- keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files in cwd" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "find files in git" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "open recent files" })

			vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "find string in cwd" })
			vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "find string under cursor in cwd" })

			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "list references" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "list definitions" })

			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "list git commits" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "list git branches" })

			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "list help tags" })

			telescope.load_extension("fzf")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
