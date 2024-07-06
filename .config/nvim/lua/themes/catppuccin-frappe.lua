local M = {}

M.base_30 = {
	white = "#c6d0f5", -- text
	darker_black = "#232634", -- crust
	black = "#292c3c", -- mantle
	black2 = "#414559", -- surface0
	one_bg = "#51576d", -- surcace1
	one_bg2 = "#626880", -- surface2
	one_bg3 = "#737994", -- overlay0
	grey = "#838ba7", -- overlay1
	grey_fg = "#949cbb", -- overlay2
	grey_fg2 = "#a5adce", -- subtext0
	light_grey = "#b5bfe2", -- subtext1

	lavender = "#f2d5cf", -- rosewater
	purple = "#babbf1", -- lavender
	dark_purple = "#ca9ee6", -- mauve

	baby_pink = "#eebebe", -- flamingo
	pink = "#f4b8e4", -- pink

	red = "#e78284", -- red

	orange = "#ef9f76", -- peach

	yellow = "#e5c890", -- yellow
	sun = "#ea999c", -- maroon

	green = "#a6d189", -- green
	vibrant_green = "#94cda4", -- between green and teal

	teal = "#81c8be", -- teal
	cyan = "#99d1db", -- sky
	nord_blue = "#85c1dc", -- sapphire
	blue = "#8caaee", -- blue

	line = "#626880", -- surface2
	statusline_bg = "#232634", -- crust
	lightbg = "#292c3c", -- mantle
	pmenu_bg = "#a6d189", -- green
	folder_bg = "#85c1dc", -- sapphire
}

M.base_16 = {
	base00 = "#303446", -- base
	base01 = "#414559", -- surface0
	base02 = "#51576d", -- surcace1
	base03 = "#626880", -- surface2
	base04 = "#737994", -- overlay0
	base05 = "#949cbb", -- overlay2
	base06 = "#b5bfe2", -- subtext1
	base07 = "#c6d0f5", -- text
	base08 = "#e78284", -- red
	base09 = "#ef9f76", -- peach
	base0A = "#e5c890", -- yellow
	base0B = "#a6d189", -- green
	base0C = "#99d1db", -- sky
	base0D = "#8caaee", -- blue
	base0E = "#ca9ee6", -- mauve
	base0F = "#ea999c", -- maroon
}

M.polish_hl = {
	treesitter = {
		["@variable"] = { fg = M.base_30.lavender },
		["@property"] = { fg = M.base_30.teal },
		["@variable.builtin"] = { fg = M.base_30.red },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin-frappe")

return M
