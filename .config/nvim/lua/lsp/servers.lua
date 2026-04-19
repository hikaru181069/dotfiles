return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_keymaps = require("core.lsp_keymaps")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          lsp_keymaps.on_attach(client, args.buf)
        end,
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {})
      vim.lsp.config("eslint", {})
      vim.lsp.config("html", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("tailwindcss", {})
      vim.lsp.config("emmet_language_server", {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascriptreact",
          "typescriptreact",
        },
      })
      vim.lsp.config("pyright", {
        settings = {
          pyright = {
            disableOrganizeImports = false,
          },
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("emmet_language_server")
      vim.lsp.enable("pyright")
      vim.lsp.enable("lua_ls")
    end,
  },
}
