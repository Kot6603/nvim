local some_config = function()
  local status, lualine = pcall(require, "lualine")
  if not status then
    return
  end

  local lualine_nightfly = require("lualine.themes.nightfly")

  -- new colors for theme
  local new_colors = {
    blue = "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    black = "#000000",
  }

  -- stylua: ignore
  local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
  }

  -- change nightlfy theme colors
  lualine_nightfly.normal.a.bg = new_colors.blue
  lualine_nightfly.insert.a.bg = new_colors.green
  lualine_nightfly.visual.a.bg = new_colors.violet
  lualine_nightfly.command = {
    a = {
      gui = "bold",
      bg = new_colors.yellow,
      fg = new_colors.black, -- black
    },
  }

  local bubbles_theme = {
    normal = {
      a = { fg = colors.black, bg = colors.violet },
      b = { fg = colors.white, bg = colors.grey },
      c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.black },
    },
  }

  lualine.setup({
    options = {
      theme = bubbles_theme,
      component_separators = "|",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = { "filename", "branch" },
      lualine_c = { "fileformat" },
      lualine_x = {},
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  })
end

return {
	{ 
    "nvim-lualine/lualine.nvim",
    config = some_config
  }, -- status line
}
