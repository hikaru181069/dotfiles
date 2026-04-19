return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")

      notify.setup({
        stages = "fade_in_slide_out", --variation  fade, slide, static, fade_in_slide_out
        timeout = 1000,
        render = "default",           -- variation default, minimal, simple, compact, wrapped-default, wrapped-compact
        background_colour = "#1e1e2e",
      })

      vim.notify = notify
    end,
  },
}
