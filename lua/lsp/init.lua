-- lua/lsp/init.lua

local M = {}

-- shared capabilities (cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp.default_capabilities(capabilities)
end

-- 1) Спільні речі
local function on_attach(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	-- map("n", "gr", vim.lsp.buf.references, "References")
	-- map("n", "gD", vim.lsp.buf.declaration, "Declaration")
	-- map("n", "gi", vim.lsp.buf.implementation, "Implementation")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	map("n", "<leader>ca", function()
		require("tiny-code-action").code_action()
	end, "Code Action")
	map("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, "Format")

	-- keymaps definition for code navigation
	require("lsp.keymaps").attach(bufnr)
end

function M.with_defaults(cfg)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, cfg or {})
end

function M.enable_stack(name)
	require("lsp.stacks." .. name)(M)
end

M.enable_stack("lua")
M.enable_stack("angular")

return M
