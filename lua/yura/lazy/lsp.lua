return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", 
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
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
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
        handlers = {
           function (server_name) -- default handler (optional)
               lspconfig[server_name].setup({})
           end,
        }
      })
      -- Global Mapping
      -- see ":help vim.diagnostic.*" for documentation
      -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completetion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          -- Buffer local mappings
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- go to definition
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- go to implementation
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- displays hover information about symbol under cursor
          vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts) -- list all symbols in quickfix
          vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts) -- diagnose that shi
          vim.keymap.set({ 'n', 'v' }, '<leader>vca', vim.lsp.buf.code_action, opts) -- selects an available code action
          vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts) -- lists all the references to current symbol
          vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts) -- renames all references to the symbol under the cursor
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts) -- shows the signature
          vim.keymap.set('n', '<leader>vtd', vim.lsp.buf.type_definition, opts) -- shows type definition

          -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          -- vim.keymap.set('n', '<space>f', function()
          --   vim.lsp.buf.format { async = true }
          -- end, opts)
        end
      })
    end
  },
}
			-- -- Autocompletion
			-- { "hrsh7th/nvim-cmp" },
			-- { "hrsh7th/cmp-buffer" },
			-- { "hrsh7th/cmp-path" },
			-- { "saadparwaiz1/cmp_luasnip" },
			-- { "hrsh7th/cmp-nvim-lsp" },
			-- { "hrsh7th/cmp-nvim-lua" },
			--
-- -- import cmp-nvim-lsp plugin safely
-- local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- -- import typescript plugin safely
-- local typescript_setup, typescript = pcall(require, "typescript")
--
-- local on_attach = function(client, bufnr)
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
-- 	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
-- 	keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
-- 	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
-- 	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
-- 	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
-- 	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
-- 	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
-- 	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
-- 	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
-- 	keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
-- 	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
-- 	-- typescript specific keymaps (e.g. rename file and update imports)
-- 	if client.name == "tsserver" then
-- 		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
-- 		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
-- 		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
-- 	end
-- end
--
-- -- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()
--
-- -- Change the Diagnostic symbols in the sign column (gutter)
-- -- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
--
-- -- configure html server
-- lspconfig["html"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure typescript server with plugin
-- typescript.setup({
-- 	server = {
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 	},
-- })
--
-- -- configure css server
-- lspconfig["cssls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- -- configure emmet language server
-- lspconfig["emmet_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })
--
-- -- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = { -- custom settings for lua
-- 		Lua = {
-- 			-- make the language server recognize "vim" global
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- make language server aware of runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })
--
-- lspconfig["pyright"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
