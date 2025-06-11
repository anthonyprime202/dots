return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				update_cwd = true,
				renderer = {
					icons = {
						web_devicons = {
							folder = {
								enable = true,
							},
						},
						git_placement = "right_align",
					},
				},
				actions = {
					open_file = {
						resize_window = true,
					},
				},
				view = {
					side = "left",
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				filters = {
					dotfiles = false,
				},
				modified = {
					enable = true,
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 500,
				},
				diagnostics = {
					enable = true,
				},
			})
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
