require "nvchad.options"


-- set relative line numbers
vim.cmd("set nu rnu")

-- Set yank buffer as clipboard
vim.cmd("set clipboard+=unnamedplus")

-- some plugins require python to run
-- add extra providers here if needed
local enable_providers = {
  "python3_provider",
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
