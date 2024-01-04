return {
	{
		"kyazdani42/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },

    config = function()
      local nvimtree = require("nvim-tree")
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      -- recommended settings from nvim-tree documentation
      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1

      -- configure nvim-tree
      nvimtree.setup({
        -- change folder arrow icons
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
              },
            },
          },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        -- 	git = {
        -- 		ignore = false,
        -- 	},
      })

    end

	},
}
