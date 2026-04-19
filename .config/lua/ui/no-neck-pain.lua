return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = "NoNeckPain",
    keys = {
      { "<leader>tn", "<cmd>NoNeckPain<cr>", desc = "Toggle No Neck Pain" },
    },
    opts = {
      width = 110,
      autocmds = {
        enableOnVimEnter = false,
      },
      buffers = {
        colors = {
          background = "#181825",
          blend = 0,
        },
        bo = {
          filetype = "no-neck-pain",
        },
        wo = {
          winfixwidth = true,
          winhighlight = "Normal:NoNeckPainBg,EndOfBuffer:NoNeckPainBg",
        },
        left = {
          enabled = true,
        },
        right = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "NoNeckPainBg", { bg = "#181825" })
      require("no-neck-pain").setup(opts)
    end,
  },
}
