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
					conditionals = { "italic" },
					loops = { "italic" },
					functions = {},
					variables = {},
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
							-- =========================================================
							-- Luxury Modern Catppuccin Mocha
							-- Rule:
							-- - Base syntax is calm
							-- - Important language structure gets elegant accents
							-- - Avoid overusing strong red/yellow/green
							-- =========================================================

							-- comments
							Comment = { fg = C.overlay0, italic = true },
							["@comment"] = { fg = C.overlay0, italic = true },

							-- keywords
							-- 言語の骨格は mauve / lavender 系で統一
							["@keyword"] = { fg = C.mauve, italic = true },
							["@keyword.conditional"] = { fg = C.lavender, italic = true },
							["@keyword.repeat"] = { fg = C.lavender, italic = true },
							["@keyword.return"] = { fg = C.mauve, italic = true },

							-- import / export / async
							-- モジュール境界は teal 系で上品に区別
							["@keyword.import"] = { fg = C.teal, italic = true },
							["@keyword.export"] = { fg = C.teal, italic = true },
							["@keyword.coroutine"] = { fg = C.teal, italic = true },

							-- function keyword
							["@keyword.function"] = { fg = C.mauve, italic = true },

							-- types / classes
							-- 型・クラスは peach で控えめに高級感を出す
							["@type"] = { fg = C.peach },
							["@type.builtin"] = { fg = C.peach, italic = true },
							["@type.definition"] = { fg = C.peach },
							["@constructor"] = { fg = C.peach },

							-- functions
							-- 関数名は blue 系。視認性は高いが派手すぎない
							["@function"] = { fg = C.blue },
							["@function.call"] = { fg = C.blue },
							["@function.method"] = { fg = C.sapphire },
							["@function.method.call"] = { fg = C.sapphire },
							["@function.builtin"] = { fg = C.sky, italic = true },

							-- variables
							-- 通常変数は text のまま。ここを派手にしないのが重要
							["@variable"] = { fg = C.text },
							["@parameter"] = { fg = C.rosewater, italic = true },
							["@variable.builtin"] = { fg = C.maroon, italic = true },

							-- properties / fields
							-- object.property は green だが、強調しすぎない
							["@property"] = { fg = C.green },
							["@variable.member"] = { fg = C.green },
							["@field"] = { fg = C.green },

							-- constants
							["@constant"] = { fg = C.flamingo },
							["@constant.builtin"] = { fg = C.flamingo, italic = true },

							-- strings
							-- 文字列は green よりも柔らかい teal 寄りにするとモダン
							["@string"] = { fg = C.teal },
							["@string.escape"] = { fg = C.sky, italic = true },
							["@string.special"] = { fg = C.sky },

							-- numbers / booleans
							["@number"] = { fg = C.peach },
							["@float"] = { fg = C.peach },
							["@boolean"] = { fg = C.maroon, italic = true },

							-- JSX / TSX
							-- tag は mauve、attribute は rosewater で上品に
							["@tag"] = { fg = C.mauve },
							["@tag.attribute"] = { fg = C.rosewater, italic = true },
							["@tag.delimiter"] = { fg = C.overlay2 },

							-- operators / punctuation
							-- 記号はかなり控えめにして高級感を出す
							["@operator"] = { fg = C.lavender },
							["@punctuation.delimiter"] = { fg = C.overlay1 },
							["@punctuation.bracket"] = { fg = C.overlay1 },
							["@punctuation.special"] = { fg = C.sky },

							-- modules / namespaces
							["@module"] = { fg = C.sapphire },
							["@namespace"] = { fg = C.sapphire, italic = true },

							-- labels / macro
							["@label"] = { fg = C.lavender },
							["@function.macro"] = { fg = C.mauve },

							-- markup / markdown
							["@markup.heading"] = { fg = C.mauve },
							["@markup.link"] = { fg = C.blue, underline = true },
							["@markup.raw"] = { fg = C.teal },
							["@markup.italic"] = { italic = true },
							["@markup.strong"] = { bold = true },

							-- UI detail
							LineNr = { fg = C.overlay0 },
							CursorLineNr = { fg = C.lavender },
							SignColumn = { bg = C.base },
							CursorLine = { bg = C.surface0 },

							-- search
							Search = { fg = C.base, bg = C.peach },
							IncSearch = { fg = C.base, bg = C.mauve },

							-- visual selection
							Visual = { bg = C.surface2 },

							-- diagnostics
							--[[	DiagnosticError = { fg = C.red },
							DiagnosticWarn = { fg = C.peach },
							DiagnosticInfo = { fg = C.sky },
							DiagnosticHint = { fg = C.teal },

							-- Git signs
							GitSignsAdd = { fg = C.teal },
							GitSignsChange = { fg = C.peach },
							GitSignsDelete = { fg = C.red }, --]]
						}
					end,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
