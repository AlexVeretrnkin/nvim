return {
	require("plugins.ui"), -- тема, статусбар, gitsigns
	require("plugins.treesitter"), -- Treesitter
	require("plugins.telescope"), -- Telescope
	require("plugins.themes"), -- Themes
	require("plugins.cmp"),        -- nvim-cmp (completion)
	require("plugins.tiny-code-action"),
	require("plugins.git-signs"),
	require("plugins.mini"),
	-- require("plugins.lsp"),        -- Mason, lspconfig
	-- require("plugins.conform"),    -- форматування
	-- require("plugins.qol"),        -- autopairs, which-key
}
