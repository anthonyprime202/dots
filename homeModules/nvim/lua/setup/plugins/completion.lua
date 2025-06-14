return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = function()
				if vim.fn.has("win32") or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end,
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind-nvim",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completetion = { completeoopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert(require("setup.keymaps").completions(cmp, luasnip)),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "crates" },
			},

			formatting = {
				format = require("lspkind").cmp_format({
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
		})
	end,
}
