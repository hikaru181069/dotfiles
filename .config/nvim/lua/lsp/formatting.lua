return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },

				python = { "ruff_format" },

				lua = { "stylua" },
			},

			format_on_save = function(bufnr)
				local ignore_filetypes = {}

				if ignore_filetypes[vim.bo[bufnr].filetype] then
					return
				end

				return {
					timeout_ms = 1000,
					lsp_format = "fallback",
				}
			end,
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
