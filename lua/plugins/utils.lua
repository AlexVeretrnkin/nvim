return {
	-- автозакривання дужок, лапок тощо
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {}, -- можна лишити порожнім
	},
	-- покращені підказки для клавіш (після натискання <leader>)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			icons = { mappings = true },
			win = {
				border = "rounded",
				title = true,
				title_pos = "center",
			},
		},
	},

	-- коментування рядків / блоків
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	-- швидке оточення символами ("", '', (), {})
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		opts = {},
	},
}
