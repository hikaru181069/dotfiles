return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"AndreM222/copilot-lualine",
		},

		config = function()
			local C = {
				base = "#1e1e2e",
				dark = "#181825",
				highdark = "#313244",
				middark = "#45475a",
				ice = "#bac2de",
				fog = "#7f849c",
				steel = "#6c7086",
				ocean = "#585b70",
				text = "#11111b",
			}

			local mode_colors = {
				n = "#585b70",
				i = "#94e2d5",
				v = "#cba6f7",
				V = "#cba6f7",
				["\22"] = "#cba6f7",
				c = "#f9e2af",
				R = "#f38ba8",
			}

			local mode_sep_colors = {
				n = "#6c7086",
				i = "#bceee6",
				v = "#dcc6fa",
				V = "#dcc6fa",
				["\22"] = "#dcc6fa",
				c = "#fdf1c9",
				R = "#f8c1cf",
			}

			local mode_icon_map = {
				n = "󰅶",
				i = "",
				v = "󰈈",
				V = "󰈈",
				["\22"] = "󰈈",
				c = "",
				R = "󰛔",
			}

			local mode_name_map = {
				n = "N",
				i = "I",
				v = "V",
				V = "V",
				["\22"] = "V",
				c = "C",
				R = "R",
			}

			local function current_mode()
				return vim.fn.mode()
			end

			local function mode_bg()
				local m = current_mode()
				return mode_colors[m] or mode_colors.n
			end

			local function mode_sep_color()
				local m = current_mode()
				return mode_sep_colors[m] or mode_sep_colors.n
			end

			local function mode_label()
				local m = current_mode()
				local icon = mode_icon_map[m] or ""
				local name = mode_name_map[m] or "N"
				return (" %s %s "):format(icon, name)
			end

			local function seg_right_dynamic(comp, bold)
				return {
					comp,
					color = function()
						return {
							fg = C.text,
							bg = mode_bg(),
							gui = bold and "bold" or nil,
						}
					end,
					padding = { left = 1, right = 1 },
				}
			end

			local function seg_left_dynamic(comp, bold)
				return {
					comp,
					color = function()
						return {
							fg = C.text,
							bg = mode_bg(),
							gui = bold and "bold" or nil,
						}
					end,
					padding = { left = 1, right = 1 },
				}
			end

			local function seg_right(bg, fg, comp, bold)
				return {
					comp,
					color = { fg = fg, bg = bg, gui = bold and "bold" or nil },
					padding = { left = 1, right = 1 },
				}
			end

			local function seg_right_3(bg, fg, comp, bold)
				local t = type(comp) == "table" and vim.deepcopy(comp) or { comp }
				t.color = { fg = fg, bg = bg, gui = bold and "bold" or nil }
				t.padding = { left = 1, right = 1 }
				return t
			end

			local function seg_left(fg, bg, comp, bold)
				return {
					comp,
					color = { fg = bg, bg = fg, gui = bold and "bold" or nil },
					padding = { left = 1, right = 1 },
				}
			end

			local function sep_right(sep_fg, sep_bg)
				return {
					function()
						return ""
					end,
					color = { fg = sep_fg, bg = sep_bg },
					padding = { left = 0, right = 0 },
				}
			end

			local function sep_left(fg, bg)
				return {
					function()
						return ""
					end,
					color = { fg = fg, bg = bg },
					padding = { left = 0, right = 0 },
				}
			end

			local function sep_left_thin_2(bg)
				return {
					function()
						return ""
					end,
					color = { fg = C.ice, bg = bg },
					padding = { left = 1, right = 0 },
				}
			end

			local function sep_right_mode(next_bg)
				return {
					function()
						return ""
					end,
					color = function()
						return {
							fg = mode_sep_color(),
							bg = next_bg or C.base,
						}
					end,
					padding = { left = 0, right = 0 },
				}
			end

			local function sep_left_mode(next_bg)
				return {
					function()
						return ""
					end,
					color = function()
						return {
							bg = next_bg or C.base,
							fg = mode_sep_color(),
						}
					end,
					padding = { left = 0, right = 0 },
				}
			end

			local function sep_right_thin(sep_fg, sep_bg)
				return {
					function()
						return ""
					end,
					color = { fg = sep_fg, bg = sep_bg },
					padding = { left = 0, right = 0 },
				}
			end

			local function sep_left_thin(sep_fg, sep_bg)
				return {
					function()
						return ""
					end,
					color = { fg = sep_fg, bg = sep_bg },
					padding = { left = 0, right = 0 },
				}
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "",
					section_separators = "",
					globalstatus = false,
					disabled_filetypes = {
						statusline = { "NvimTree", "no-neck-pain" },
					},
				},

				sections = {
					lualine_a = {
						seg_right_dynamic(mode_label, true),
						sep_right_mode(C.dark),
						--[[	sep_right("#a6adc8", "#9399b2"),
						sep_right("#9399b2", "#7f849c"),
						sep_right("#7f849c", "#6c7086"),
						sep_right("#6c7086", "#585b70"),
						sep_right("#585b70", C.dark),
												sep_right_mode(C.steel), --]]
					},

					lualine_b = {
						seg_right(C.dark, C.fog, "branch", true),
						sep_right_thin(C.fog, C.dark),
						seg_right_3(C.dark, C.fog, {
							"diff",
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							colored = true,
							always_visible = false,
						}, true),
						sep_right_thin(C.fog, C.dark),
						seg_right(C.dark, C.fog, "filename", true),
						sep_right_thin(C.fog, C.dark),
					},

					lualine_c = {
						seg_right(C.dark, C.fog, "diagnostics", true),
						{
							"copilot",
							cond = function()
								local ft = vim.bo.filetype
								local disabled_ft = {
									javascript = true,
									html = true,
									css = true,
									typescript = true,
									javascriptreact = true,
									typescriptreact = true,
								}
								return not disabled_ft[ft]
							end,
						},
					},

					lualine_x = {
						--[[	sep_left("#9399b2", C.base),
						sep_left("#7f849c", "#9399b2"),
						sep_left("#6c7086", "#7f849c"),
						sep_left("#585b70", "#6c7086"),
						sep_left("#313244", "#585b70"),
						sep_left(C.dark, "#313244"), --]]
						sep_left_thin(C.fog, C.dark),
						seg_left(C.dark, C.fog, "filetype", true),
					},

					lualine_y = {
						sep_left(C.dark, C.dark),
						sep_left_thin(C.fog, C.dark),
					},

					lualine_z = {
						--sep_left_mode("#ae81ff"),
						--seg_left_2(mode_bg()),
						seg_left(C.dark, C.fog, "progress", true),
						sep_left_mode(C.dark),
						seg_left_dynamic("location", true),
					},
				},
			})
		end,
	},
}
