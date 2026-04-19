return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>R",  desc = "Rest client" },
      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>",         desc = "Send request" },
      { "<leader>Ra", "<cmd>lua require('kulala').run_all()<cr>",     desc = "Send all requests" },
      { "<leader>Rb", "<cmd>lua require('kulala').scratchpad()<cr>",  desc = "Open scratchpad" },
      { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle view" },
      { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>",   desc = "Prev request" },
      { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>",   desc = "Next request" },
    },
    opts = {
      default_view = "body",
      default_env = "dev",
      debug = false,
    },
  },
}
