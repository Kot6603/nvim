return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gl", "<Cmd>Git log<CR>")
		vim.keymap.set("n", "<leader>gw", "<Cmd>Git blame<CR>")
	end,
}
