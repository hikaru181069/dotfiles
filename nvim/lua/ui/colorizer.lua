return {
  {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local ccc = require("ccc")

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })

      vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<cr>", { desc = "Color Picker" })
    end,
  },
}
