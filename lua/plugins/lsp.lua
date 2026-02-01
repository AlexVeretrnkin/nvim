-- lua/plugins/lsp.lua
return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = { ui = { border = "rounded" } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"lua_ls", -- 👈 потрібен для lua_ls
				"angularls", -- angularls
				-- "ts_ls", -- tsserver (для TS)
				"vtsls",
				-- "tsgo", -- tsserver (для TS)
				"eslint", -- eslint
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp") -- 👈 наш модуль нижче
		end,
	},
}
