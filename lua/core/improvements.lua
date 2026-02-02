-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("core.angular-switcher")
require("core.buffers")

vim.keymap.set("n", "<leader>cd", function()
	-- Get the directory of the current file as a relative path
	local relative_dir = vim.fn.expand("%:.:h")
	-- Copy it into the clipboard
	vim.fn.setreg("+", relative_dir)
end, { desc = "Copy current file directory (relative) to clipboard" })
