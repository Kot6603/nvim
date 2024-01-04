return {
  {
    "folke/zen-mode.nvim",
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>zz", function()
        require("zen-mode").toggle({
          window = {
            width = 90,
            options = {}
          },
        })
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end)
      vim.keymap.set("n", "<leader>zZ", function()
        require("zen-mode").toggle({
          window = {
            width = 90,
            options = {}
          },
        })
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end)
    end
  },
}
