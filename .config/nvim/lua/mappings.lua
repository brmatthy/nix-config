require("nvchad.mappings")

-- functions to create or remove mappings
local map = vim.keymap.set
local nomap = vim.keymap.del

-- Mapping for oil.nvim
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open paretn directory" })

-- mappings for telescope
map("n", "<leader>fg", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })

-- mappings for flash
map("n", "<leader>jf", function()
	require("flash").jump()
end, { desc = "Flash" })
map("n", "<leader>jF", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })
map("n", "<leader>jr", function()
	require("flash").remote()
end, { desc = "Remote flash" })
map("n", "<leader>jR", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter search" })

-- Disable mappings
nomap("n", "<leader>fw")
