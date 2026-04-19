-- nvim-treeの下の余白を改善

vim.api.nvim_create_augroup("NvimTreeBottomFix", { clear = true })

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "WinEnter" }, {
  group = "NvimTreeBottomFix",
  callback = function()
    if vim.bo.filetype ~= "NvimTree" then
      return
    end

    local win = vim.api.nvim_get_current_win()

    vim.wo[win].winhighlight =
    "Normal:NvimTreeNormal,NormalNC:NvimTreeNormal,EndOfBuffer:NvimTreeEndOfBuffer,StatusLine:NvimTreeBottom,StatusLineNC:NvimTreeBottom"

    vim.wo[win].statusline = "%#NvimTreeBottom#%="
  end,
})
