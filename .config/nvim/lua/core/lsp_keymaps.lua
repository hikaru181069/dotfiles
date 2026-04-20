local M = {}

function M.on_attach(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, {
			buffer = bufnr,
			silent = true,
			desc = desc,
		})
	end

	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gr", vim.lsp.buf.references, "References")
	map("n", "gi", vim.lsp.buf.implementation, "Implementation")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

	map("n", "<leader>f", function()
		require("conform").format({
			async = true,
			lsp_format = "fallback",
		})
	end, "Format")

	map("n", "<leader>gl", vim.diagnostic.open_float, "Line diagnostics")
	map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
end

return M
