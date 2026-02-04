return function(lsp)
	vim.lsp.config(
		"lua_ls",
		lsp.with_defaults({
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = { enable = false },
				},
			},
		})
	)

	vim.lsp.enable("lua_ls")
end
