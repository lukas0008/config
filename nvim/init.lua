vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- space leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- two spaces, not tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2 -- Number of spaces to insert for indentation
vim.opt.tabstop = 2 -- Number of visual spaces a tab occupies
vim.opt.softtabstop = 2 -- Number of spaces for inserting/deleting tabs
vim.opt.smartindent = true -- Enable smart indenting

-- inline hints
vim.lsp.inlay_hint.enable(true)

require("config.lazy")

vim.lsp.enable("clangd")
-- plugin setups
require("mason").setup()
require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"target",
			"node_modules",
			"build",
		},
	},
})
require("lsp_lines").setup()
require("mini.files").setup({})

require("lspconfig").clangd.setup({})

vim.lsp.config("clangd", {
	-- Optional: Add server-specific settings here
})
vim.lsp.enable("clangd")

vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

vim.cmd("colorscheme tokyonight-night")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.buf.hover()
end, { desc = "Show lsp hover info" })
vim.keymap.set("n", "<leader>e", MiniFiles.open)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action)
