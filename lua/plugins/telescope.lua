local prefix_key = "<leader>s"

local function createKeymap(key)
	return prefix_key .. key
end

local function loadCustomAngularExtension()
	local ok, telescope = pcall(require, "telescope")
	if not ok then
		return nil
	end
	return telescope.extensions.angular
end

return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		opts = function()
			local action_layout = require("telescope.actions.layout")
			return {
				defaults = {
					prompt_prefix = "  ",
					selection_caret = " ",
					sorting_strategy = "ascending",
					layout_config = { prompt_position = "top" },
					mappings = {
						n = { ["<M-p>"] = action_layout.toggle_preview },
						i = { ["<M-p>"] = action_layout.toggle_preview },
					},
				},
				pickers = {
					find_files = { hidden = true },
				},
			}
		end,
		keys = {
			{
				"<leader><leader>",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				createKeymap("f"),
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				createKeymap("g"),
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				createKeymap("h"),
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
			{
				createKeymap("r"),
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Recent files",
			},
			{
				createKeymap("d"),
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				createKeymap("ac"),
				function()
					loadCustomAngularExtension().find_in_component()
				end,
				desc = "Find in Angular component(.ts)",
			},
			{
				createKeymap("at"),
				function()
					loadCustomAngularExtension().find_in_component_template()
				end,
				desc = "Find in Angular template(.html)",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			pcall(telescope.load_extension, "fzf")
			loadCustomAngularExtension()
		end,
	},
}
