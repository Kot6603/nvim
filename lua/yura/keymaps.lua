vim.g.mapleader = " "

local keymap = vim.keymap -- :D

-- general keymaps

-- cancelled
keymap.set("i", "<C-c>", "<Esc>") -- cancel insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlight
keymap.set("n", "x", '"_x') -- delete char without copying to register
keymap.set("x", "<leader>p", '"_dP') -- replace and paste
keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

keymap.set("n", "<leader>be", ":bprevious<CR>") -- go to prev buffer
keymap.set("n", "<leader>q", ":bnext<CR>") -- go to next buffer
keymap.set("n", "<leader>bd", ":bdelete<CR>") -- delete current buffer

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copying to system clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- deleting without yanking
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- terminal configs
local term_job_id = 0
keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	vim.api.nvim_feedkeys("i", "n", true)
	term_job_id = vim.bo.channel
end)

keymap.set("n", "<leader>example", function()
	vim.fn.chansend(term_job_id, { "ls -al\r\n" })
end)

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>th", "<C-w>v <C-w>h <cmd>term<CR> i")
keymap.set("n", "<leader>tj", "<C-w>s <cmd>term<CR> i")
keymap.set("n", "<leader>tk", "<C-w>s <C-w>k <cmd>term<CR> i")
keymap.set("n", "<leader>tl", "<C-w>v <cmd>term<CR> i")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- plugin keymaps --

-- vim-maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>") -- maximise split window or restore back

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR> <cmd>only<CR>") -- toggles file explorer keymap.set("n", "<leader>e", ":Ex<CR>") -- toggles file explorer
keymap.set("n", "<leader>e", ":Ex<CR>") -- toggles file explorer

-- obsidian
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>") -- open obsidian
keymap.set("n", "<leader>ol", "<cmd>ObsidianLink<cr>") -- open link in obsidian
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create New Note" }) -- create new note in obsidian
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search Obsidian" }) -- Search obsidian
keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian Quick Switch" })

-- undotree
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- lazygit
keymap.set("n", "<leader>gg", "<Cmd>LazyGit<CR>")

-- fugitive
keymap.set("n", "gh", ":diffget //2<CR>") -- get changes from left
keymap.set("n", "gl", ":diffget //3<CR>") -- get changes from right
