return {
	require("plugins.themes.rose-pine"),
	require("plugins.themes.catppuccin"),
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
