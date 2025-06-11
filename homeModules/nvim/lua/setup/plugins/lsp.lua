local function handleServers(servers)
	for server, opts in pairs(servers) do
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		if server == "html" then
			capabilities.textDocument.completion.completionItem.snippetSupport = true
		end

		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		capabilities = vim.tbl_deep_extend("force", capabilities, require("lsp-file-operations").default_capabilities())
		opts.capabilities = capabilities

		require("lspconfig")[server].setup(opts)
	end
end

local servers = {
	-- Nix
	nil_ls = {},

	-- Tailwind
	tailwindcss = {},

	-- C / CPP
	clangd = {},

	-- Svelte
	svelte = {},

	-- HTML / CSS
	html = {},

	emmet_language_server = {},

	cssls = {},

	-- Typescript / Javascript
	ts_ls = {},

	-- RUST
	rust_analyzer = {
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
	},

	-- Python
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					-- linter options
					pylint = { enabled = true, executable = "pylint" },
					pyflakes = { enabled = true },
					pycodestyle = { enabled = true },

					-- type checker
					pylsp_mypy = { enabled = true },

					-- auto-completion options
					jedi_completion = { fuzzy = true },
				},
			},
		},
	},

	-- LUA
	lua_ls = {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			})
		end,
		settings = {
			Lua = {},
		},
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						winblend = 0,
					},
				},
			},
		},
	},

	config = function()
		require("setup.autocmds").lsp()
		handleServers(servers)
	end,
}
