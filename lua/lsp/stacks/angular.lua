-- this is LSP stack for angular development
-- lua/lsp/stacks/angular.lua

return function(lsp)
	-- Angular Language Server
	vim.lsp.config("angularls", lsp.with_defaults())

	-- HTML/CSS LSP (корисно для template/style файлів у проєкті)
	vim.lsp.config("html", lsp.with_defaults())
	vim.lsp.config("cssls", lsp.with_defaults())
	vim.lsp.config("css_variables", lsp.with_defaults())

	-- Emmet (швидка верстка в html/scss)
	vim.lsp.config("emmet_ls", lsp.with_defaults())

	-- enable
	vim.lsp.enable("angularls")
	vim.lsp.enable("html")
	vim.lsp.enable("cssls")
	vim.lsp.enable("emmet_ls")
	-- typescript LSP
	-- vim.lsp.enable("ts_ls")
	vim.lsp.enable("tsgo")
	vim.lsp.enable("css_variables")
	vim.lsp.enable("somesass_ls")
end
