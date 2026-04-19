local function set_hl()
  local set = vim.api.nvim_set_hl

  -- 行番号 / sign
  set(0, "LineNr", { fg = "#6c7086", bg = "NONE" })
  set(0, "CursorLineNr", { fg = "#f9e2af", bg = "NONE", bold = true })
  set(0, "CursorLine", { bg = "#181825" })

  set(0, "SignColumn", { bg = "NONE" })
  set(0, "CursorLineSign", { bg = "#181825" })
  set(0, "LineNrAbove", { fg = "#585b70", bg = "NONE" })
  set(0, "LineNrBelow", { fg = "#585b70", bg = "NONE" })

  -- diagnostics
  set(0, "DiagnosticError", { fg = "#f38ba8" })
  set(0, "DiagnosticWarn", { fg = "#f9e2af" })
  set(0, "DiagnosticInfo", { fg = "#89b4fa" })
  set(0, "DiagnosticHint", { fg = "#94e2d5" })
  set(0, "DiagnosticOk", { fg = "#a6e3a1" })

  set(0, "DiagnosticSignError", { fg = "#f38ba8", bg = "NONE" })
  set(0, "DiagnosticSignWarn", { fg = "#f9e2af", bg = "NONE" })
  set(0, "DiagnosticSignInfo", { fg = "#89b4fa", bg = "NONE" })
  set(0, "DiagnosticSignHint", { fg = "#94e2d5", bg = "NONE" })
  set(0, "DiagnosticSignOk", { fg = "#a6e3a1", bg = "NONE" })

  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#f38ba8" })
  set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#f9e2af" })
  set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#89b4fa" })
  set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#94e2d5" })

  set(0, "DiagnosticFloatingError", { fg = "#f38ba8", bg = "NONE" })
  set(0, "DiagnosticFloatingWarn", { fg = "#f9e2af", bg = "NONE" })
  set(0, "DiagnosticFloatingInfo", { fg = "#89b4fa", bg = "NONE" })
  set(0, "DiagnosticFloatingHint", { fg = "#94e2d5", bg = "NONE" })

  -- float / popup
  set(0, "NormalFloat", { bg = "#181825" })
  set(0, "FloatBorder", { fg = "#89b4fa", bg = "#181825" })
  set(0, "FloatTitle", { fg = "#cba6f7", bg = "#181825", bold = true })

  -- 区切り線
  set(0, "WinSeparator", { fg = "#181825", bg = "#181825" })
  set(0, "VertSplit", { fg = "#181825", bg = "#181825" })

  -- rainbow delimiters
  set(0, "RainbowDelimiterRed", { fg = "#f38ba8" })
  set(0, "RainbowDelimiterYellow", { fg = "#f9e2af" })
  set(0, "RainbowDelimiterBlue", { fg = "#89b4fa" })
  set(0, "RainbowDelimiterOrange", { fg = "#fab387" })
  set(0, "RainbowDelimiterGreen", { fg = "#a6e3a1" })
  set(0, "RainbowDelimiterViolet", { fg = "#cba6f7" })
  set(0, "RainbowDelimiterCyan", { fg = "#94e2d5" })

  -- treesitter context
  set(0, "TreesitterContext", { bg = "#181825" })
  set(0, "TreesitterContextLineNumber", { fg = "#f9e2af", bg = "#181825", bold = true })
  set(0, "TreesitterContextSeparator", { fg = "#313244", bg = "NONE" })

  -- bufferline
  set(0, "BufferLineOffsetSeparator", { bg = "#181825", fg = "#181825" })

  set(0, "BufferLineFill", { bg = "#181825" })
  set(0, "BufferLineBackground", { bg = "#181825", fg = "#6c7086" })
  set(0, "BufferLineSeparator", { fg = "#181825", bg = "#181825" })
  set(0, "BufferLineSeparatorVisible", { fg = "#181825", bg = "#1e1e2e" })
  set(0, "BufferLineSeparatorSelected", { fg = "#181825", bg = "#1e1e2e" })

  set(0, "BufferLineBufferVisible", { bg = "#1e1e2e", fg = "#cdd6f4" })
  set(0, "BufferLineNumbersVisible", { bg = "#1e1e2e", fg = "#a6adc8" })
  set(0, "BufferLineModifiedVisible", { bg = "#1e1e2e", fg = "#f9e2af" })
  set(0, "BufferLineCloseButtonVisible", { bg = "#1e1e2e", fg = "#a6adc8" })

  set(0, "BufferLineTruncMarker", { bg = "#181825" })

  -- statusline
  set(0, "StatusLine", { bg = "#181825", fg = "#cdd6f4" })
  set(0, "StatusLineNC", { bg = "#181825", fg = "#6c7086" })

  -- nvim-tree
  set(0, "NvimTreeNormal", { bg = "#181825" })
  set(0, "NvimTreeEndOfBuffer", { bg = "#181825", fg = "#181825" })
  set(0, "NvimTreeBottom", { bg = "#181825", fg = "#181825" })

  -- completion popup
  set(0, "Pmenu", { bg = "#181825", fg = "#cdd6f4" })
  set(0, "PmenuSel", { bg = "#313244", fg = "#cdd6f4", bold = true })
  set(0, "PmenuSbar", { bg = "#181825" })
  set(0, "PmenuThumb", { bg = "#45475a" })

  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#313244" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#1e1e2e", fg = "#89b4fa" })
end

set_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    set_hl()
  end,
})
