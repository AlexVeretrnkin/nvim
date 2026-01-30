-- lua/lsp/keymaps.lua
local M = {}

local function builtin()
	local ok, tb = pcall(require, "telescope.builtin")

	if not ok then
		vim.notify("telescope.nvim is not available", vim.log.levels.WARN, { title = "LSP" })
		return nil
	end

	return tb
end

function M.attach(bufnr)
	local tb = builtin()
	if not tb then
		return
	end

	-- Go to / lists
	vim.keymap.set("n", "gd", tb.lsp_definitions, { buffer = bufnr, desc = "LSP Definitions (Telescope)" })
	vim.keymap.set("n", "gD", tb.lsp_definitions, { buffer = bufnr, desc = "LSP Definitions (Telescope)" })
	vim.keymap.set("n", "gr", tb.lsp_references, { buffer = bufnr, desc = "LSP References (Telescope)" })
	vim.keymap.set("n", "gi", tb.lsp_implementations, { buffer = bufnr, desc = "LSP Implementations (Telescope)" })
	vim.keymap.set("n", "gy", tb.lsp_type_definitions, { buffer = bufnr, desc = "LSP Type Definitions (Telescope)" })

	-- Symbols
	vim.keymap.set(
		"n",
		"<leader>ds",
		tb.lsp_document_symbols,
		{ buffer = bufnr, desc = "Document Symbols (Telescope)" }
	)
	vim.keymap.set(
		"n",
		"<leader>ws",
		tb.lsp_dynamic_workspace_symbols,
		{ buffer = bufnr, desc = "Workspace Symbols (Telescope)" }
	)

	-- Diagnostics
	vim.keymap.set("n", "<leader>ld", function()
		tb.diagnostics({ bufnr = bufnr })
	end, { buffer = bufnr, desc = "Diagnostics (Telescope)" })
end

return M
