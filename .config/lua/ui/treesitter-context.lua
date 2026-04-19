return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
      multiline_threshold = 5,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
    },
  },
}
