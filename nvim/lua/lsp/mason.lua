return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "jsonls",
        "tailwindcss",
        "emmet_language_server",
        "pyright",
        "lua_ls",
      },
    },
  },
}
