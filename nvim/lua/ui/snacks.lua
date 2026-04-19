return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
        scope = {
          enabled = true,
        },
      },
      input = { enabled = true },

      dashboard = { enabled = false },

      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = true,
          git_hl = true,
        },
        git = {
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50,
      },

      picker = { enabled = false },
      explorer = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      words = { enabled = false },
      scroll = { enabled = false },
    },
  },
}
