vim.api.nvim_create_user_command("BdSafe", function()
	vim.schedule(function()
		vim.cmd("silent! bdelete")
	end)
end, {})

local function cmd_safe(cmd)
	vim.schedule(function()
		vim.cmd("silent! " .. cmd)
	end)
end

vim.keymap.set("n", "<leader>cb", "<cmd>BdSafe<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>co", function()
	cmd_safe("%bd|e#|bd#")
end, { silent = true })

vim.keymap.set("n", "<leader>ck", function()
	cmd_safe("bufdo bd!")
end, { silent = true })
