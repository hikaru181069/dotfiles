return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },

      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { icon = "" },
          search_down = { icon = " " },
          search_up = { icon = " " },
          filter = { icon = "$" },
          lua = { icon = "" },
          help = { icon = "" },
        },
      },

      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },

      popupmenu = {
        enabled = true,
        backend = "nui",
      },

      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },

      views = {
        cmdline_popup = {
          position = {
            row = "40%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "NoiceCmdlinePopup",
              FloatBorder = "NoiceCmdlinePopupBorder",
            },
          },
        },

        popupmenu = {
          relative = "editor",
          position = {
            row = "48%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "FloatBorder",
            },
          },
        },
      },
    },
  },
}
