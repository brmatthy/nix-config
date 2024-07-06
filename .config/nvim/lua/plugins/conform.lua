-- add formatting, see configs.conform for the configuration
return {
	"stevearc/conform.nvim",
	event = "bufwritepre",
	config = function()
		require("configs.conform")
	end,
}
