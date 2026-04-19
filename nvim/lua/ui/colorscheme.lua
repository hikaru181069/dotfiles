return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          nvimtree   = true,
          telescope  = true,
          treesitter = true,
          gitsigns   = true,
          notify     = true,
          noice      = true,
          trouble    = true,
          incline    = true,
          snacks     = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
