local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = {
	"clangd",
	"cmake",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"html",
	"eslint",
	"lua_ls",
	"marksman",
	"typos_lsp",
	"nil_ls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
