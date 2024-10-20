return {
	-- obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/my_obsidian/kot-pkm",
				},
			},
			-- daily_notes = {
			-- 	-- Optional, if you keep daily notes in a separate directory.
			-- 	folder = "notes/dailies",
			-- 	-- Optional, if you want to change the date format for the ID of daily notes.
			-- 	date_format = "%Y-%m-%d",
			-- 	-- Optional, if you want to change the date format of the default alias of daily notes.
			-- 	alias_format = "%B %-d, %Y",
			-- 	-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			-- 	template = nil,
			-- },
			-- ui = { enable = false },
			-- Optional, boolean or a function that takes a filename and returns a boolean.
			-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
			disable_frontmatter = true,
			-- -- Optional, alternatively you can customize the frontmatter data.
			-- note_frontmatter_func = function(note)
			-- 	-- This is equivalent to the default frontmatter function.
			-- 	local out = { id = note.id, aliases = note.aliases, tags = note.tags }
			-- 	-- `note.metadata` contains any manually added fields in the frontmatter.
			-- 	-- So here we just make sure those fields are kept in the frontmatter.
			-- 	if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
			-- 		for k, v in pairs(note.metadata) do
			-- 			out[k] = v
			-- 		end
			-- 	end
			-- 	return out
			-- end,

			note_path_func = function(spec)
				local path = spec.dir / spec.title
				return path:with_suffix(".md")
			end,
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- {
	-- "iamcco/markdown-preview.nvim",
	-- 	cmd = "MarkdownPreviewToggle",
	-- },
}
