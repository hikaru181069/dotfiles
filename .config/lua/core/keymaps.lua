vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<cr>", { desc = "Twilight" })

vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
