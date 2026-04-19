return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>",            desc = "LazyGit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread", "G blame" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",        desc = "Git Status" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff Split" },
      { "<leader>gb", "<cmd>Git blame<cr>",  desc = "Git Blame" },
    },
  },
}
