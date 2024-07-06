return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",

      "rust",
      "c",
      "cpp",
      "make",
      "gitignore",
      "rust",
      "python",
    },
    auto_install = true,
  },
}
