local lsp_zero = require("lsp-zero")
require("lspconfig")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.setup()
