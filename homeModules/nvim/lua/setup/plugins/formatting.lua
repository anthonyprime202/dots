return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		notify_on_error = false,

		default_format_opts = {
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			python = { "black" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },

			-- Web dev related file types
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
			html = { "prettierd" },
			scss = { "prettierd" },
			css = { "prettierd" },

			json = { "prettierd" },
		},
	},
}
