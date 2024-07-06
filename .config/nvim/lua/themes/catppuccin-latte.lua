local M = {}

M.base_30 = {
  white         = "#4c4f69", -- text
  darker_black  = "#dce0e8", -- crust
  black         = "#e6e9ef", -- mantle
  black2        = "#ccd0da", -- surface0
  one_bg        = "#bcc0cc", -- surcace1
  one_bg2       = "#acb0be", -- surface2
  one_bg3       = "#9ca0b0", -- overlay0
  grey          = "#8c8fa1", -- overlay1
  grey_fg       = "#7c7f93", -- overlay2
  grey_fg2      = "#6c6f85", -- subtext0
  light_grey    = "#5c5f77", -- subtext1

  lavender      = "#dc8a78", -- rosewater
  purple        = "#7287fd", -- lavender
  dark_purple   = "#8839ef", -- mauve

  baby_pink     = "#dd7878", -- flamingo
  pink          = "#ea76cb", -- pink

  red           = "#d20f39", -- red

  orange        = "#fe640b", -- peach

  yellow        = "#df8e1d", -- yellow
  sun           = "#d64553", -- maroon

  green         = "#40a02b", -- green
  vibrant_green = "#94cda4", -- between green and teal

  teal          = "#179299", -- teal
  cyan          = "#04a5e5", -- sky
  nord_blue     = "#209fb5", -- sapphire
  blue          = "#1e66f5", -- blue

  line          = "#acb0be", -- surface2
  statusline_bg = "#dce0e8", -- crust
  lightbg       = "#e6e9ef", -- mantle
  pmenu_bg      = "#40a02b", -- green
  folder_bg     = "#209fb5", -- sapphire
}

M.base_16 = {
  base00 = "#eff1f5", -- base
  base01 = "#ccd0da", -- surface0
  base02 = "#bcc0cc", -- surcace1
  base03 = "#acb0be", -- surface2
  base04 = "#9ca0b0", -- overlay0
  base05 = "#7c7f93", -- overlay2
  base06 = "#5c5f77", -- subtext1
  base07 = "#4c4f69", -- text
  base08 = "#d20f39", -- red
  base09 = "#fe640b", -- peach
  base0A = "#df8e1d", -- yellow
  base0B = "#40a02b", -- green
  base0C = "#04a5e5", -- sky
  base0D = "#1e66f5", -- blue
  base0E = "#8839ef", -- mauve
  base0F = "#e64553", -- maroon
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.lavender },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.red },
  },
}

M = require("base46").override_theme(M, "catppuccin-frappe")

return M
