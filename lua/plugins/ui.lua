return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "\\", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
			},
		},
	},

	{
		-- красиві popup-повідомлення (заміна vim.notify)
		{
			"rcarriga/nvim-notify",
			event = "VeryLazy",
			opts = {
				stages = "slide", -- тип анімації: "fade", "slide", "static"
				timeout = 1000, -- мс, після яких спливає повідомлення
				render = "minimal", -- можна "minimal" або "compact"
				top_down = true, -- знизу вгору (false) або згори вниз (true)
			},
			config = function(_, opts)
				local notify = require("notify")
				notify.setup(opts)
				vim.notify = notify -- 👈 замінює стандартний vim.notify

				local notified = {}

				vim.api.nvim_create_autocmd("LspAttach", {
					callback = function(args)
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if not client then
							return
						end

						if not notified[client.name] then
							notified[client.name] = true
							vim.notify(
								("🔧 LSP started: %s"):format(client.name),
								vim.log.levels.INFO,
								{ title = "LSP" }
							)
						end

						vim.b.lsp_client_name = client.name
					end,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					callback = function(args)
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						if client then
							vim.notify(
								string.format("❌ LSP detached: %s", client.name),
								vim.log.levels.WARN,
								{ title = "LSP" }
							)
						end
					end,
				})
			end,
		},
	},
}
