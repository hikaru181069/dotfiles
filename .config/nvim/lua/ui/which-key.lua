return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        preset = "modern",
        delay = 300,
        win = {
          border = "rounded",
        },
      })

      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>h", group = "git hunks" },
        { "<leader>c", group = "code" },
        { "<leader>b", group = "buffer" },
      })
    end,
  },
}
