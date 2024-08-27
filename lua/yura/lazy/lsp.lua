return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				clangd = function(_, opts)
					opts.capabilities.offsetEncoding = { "utf-16" }
				end,
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"windwp/nvim-autopairs",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"lua_ls",
					"emmet_ls",
					"pyright",
					"clangd",
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
				handlers = {
					function(server_name) -- default handler (optional)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										-- make language server aware of runtime files
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						})
					end,
					["emmet_ls"] = function()
						-- configure emmet language server
						lspconfig["emmet_ls"].setup({
							capabilities = capabilities,
							filetypes = {
								"html",
								"typescriptreact",
								"javascriptreact",
								"css",
								"sass",
								"scss",
								"less",
								"svelte",
							},
						})
					end,
				},
			})
			-- Global Mapping
			-- see ":help vim.diagnostic.*" for documentation
			-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
			-- use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completetion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					-- Buffer local mappings
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- displays hover information about symbol under cursor
					vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts) -- list all symbols in quickfix
					vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- diagnose that shi
					vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts) -- selects an available code action
					vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) -- lists all the references to current symbol
					vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts) -- renames all references to the symbol under the cursor
					-- vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts) -- shows the signature
					vim.keymap.set("n", "<leader>vtd", vim.lsp.buf.type_definition, opts) -- shows type definition

					-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wl', function()
					--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					-- vim.keymap.set('n', '<space>f', function()
					--   vim.lsp.buf.format { async = true }
					-- end, opts)
				end,
			})

			-- configuring cmp
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
			})
			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = "buffer" },
				}),
			})
			vim.diagnostic.config({
				update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
-- -- import typescript plugin safely
-- local typescript_setup, typescript = pcall(require, "typescript")
--
-- local on_attach = function(client, bufnr)
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
-- 	-- typescript specific keymaps (e.g. rename file and update imports)
-- 	if client.name == "tsserver" then
-- 		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
-- 		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
-- 		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
-- 	end
-- end
