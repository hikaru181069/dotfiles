return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",

				styles = {
					comments = { "italic" },
					keywords = { "italic" },
				},

				integrations = {
					nvimtree = true,
					telescope = true,
					gitsigns = true,
					notify = true,
					noice = true,
					trouble = true,
					incline = true,
					snacks = true,
				},

				highlight_overrides = {
					mocha = function(C)
						return {
							-- comments
							Comment = { fg = C.overlay1, italic = true },
							["@comment"] = { fg = C.overlay1, italic = true },

							-- keywords
							["@keyword"] = { fg = C.lavender, italic = true },
							["@keyword.conditional"] = { fg = C.lavender, italic = true },
							["@keyword.repeat"] = { fg = C.lavender, italic = true },
							["@keyword.return"] = { fg = C.lavender, italic = true, bold = true },

							-- import / export / function
							["@keyword.import"] = { fg = C.sapphire, italic = true, bold = true },
							["@keyword.export"] = { fg = C.sapphire, italic = true, bold = true },
							["@keyword.function"] = { fg = C.sky, italic = true, bold = true },
							["@keyword.coroutine"] = { fg = C.teal, italic = true },

							-- types
							["@type"] = { fg = C.sapphire },
							["@type.builtin"] = { fg = C.blue, italic = true },
							["@type.definition"] = { fg = C.sapphire, bold = true },

							-- constructor / class
							["@constructor"] = { fg = C.blue, bold = true },

							-- function names
							["@function"] = { fg = C.blue },
							["@function.call"] = { fg = C.blue },
							["@function.method"] = { fg = C.blue },
							["@function.method.call"] = { fg = C.blue },
							["@function.builtin"] = { fg = C.sky, italic = true },

							-- variables
							["@variable"] = { fg = C.text },
							["@variable.builtin"] = { fg = C.lavender, italic = true },
							["@parameter"] = { fg = C.teal, italic = true },

							-- properties
							["@property"] = { fg = C.sky },

							-- constants
							["@constant"] = { fg = C.lavender },
							["@constant.builtin"] = { fg = C.sky, italic = true },

							-- strings
							["@string"] = { fg = C.green },
							["@string.escape"] = { fg = C.sky, italic = true },

							-- numbers / booleans
							["@number"] = { fg = C.blue },
							["@boolean"] = { fg = C.sapphire, italic = true },

							-- JSX / TSX
							["@tag"] = { fg = C.sapphire, bold = true },
							["@tag.attribute"] = { fg = C.sky, italic = true },
							["@tag.delimiter"] = { fg = C.overlay2 },

							-- operators / punctuation
							["@operator"] = { fg = C.lavender },
							["@punctuation.delimiter"] = { fg = C.overlay2 },
							["@punctuation.bracket"] = { fg = C.overlay2 },

							-- modules / namespaces
							["@module"] = { fg = C.sapphire },
							["@namespace"] = { fg = C.blue, italic = true },
						}
					end,
				},
			})

			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
