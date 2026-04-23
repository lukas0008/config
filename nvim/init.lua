
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
-- space leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- two spaces, not tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4 -- Number of spaces to insert for indentation
vim.opt.tabstop = 4 -- Number of visual spaces a tab occupies
vim.opt.softtabstop = 4 -- Number of spaces for inserting/deleting tabs
vim.opt.smartindent = true -- Enable smart indenting

-- inline hints
vim.lsp.inlay_hint.enable(true)


-- vim.lsp.enable("checkstyle")

vim.lsp.config("asm-lsp", {
    cmd = { "asm-lsp" },
    filetypes = { "asm", "s", "S" },
    root_dir = vim.fn.getcwd() 
    -- function(fname)
    --   local lsputil = require('lspconfig.util')
    --   -- local root = lsputil.find_git_ancestor(vim.fn.getcwd())
    --   return vim.fn.getcwd()
    -- end
})
vim.lsp.enable("asm-lsp")
vim.lsp.enable("tinymist")
vim.lsp.enable("zls")
vim.lsp.config('zls', {})
vim.lsp.enable("jdtls")
-- vim.filetype.add {
--   extension = {
--     c3 = "c3"
--   }
-- }
-- local lsputil = require('lspconfig/util')
-- vim.lsp.config('c3-lsp', {
--   cmd = { "c3lsp" },
--   filetypes = { "c3" },
--     -- root_dir = function(fname)
--     --   -- return lsputil.find_git_ancestor(fname)
--     -- end
--   })
-- vim.lsp.enable("c3-lsp")
vim.filetype.add {
  extension = {
    nu = "nu"
  }
}
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.nu",
    callback = function()
        vim.bo.filetype = "nu"
    end
})
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--     pattern = "*.c3",
--     callback = function()
--         vim.bo.filetype = "c3"
--     end
-- })
vim.lsp.enable('nushell')
vim.lsp["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  settings = {}
}
vim.lsp.enable("tinymist")

require("config.lazy")

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
require("harpoon").setup({})
-- require("typescript-language-server").setup()

vim.lsp.enable("clangd")
vim.lsp.enable("nixd")
vim.lsp.config('expert', {
  cmd = { 'expert' },
  root_markers = { 'mix.exs', '.git' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
})
vim.lsp.enable 'expert'
vim.lsp.enable("ols")
vim.lsp.config("omnisharp", {})
vim.lsp.enable("omnisharp")
vim.lsp.config["tsserver"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  --   root_dir = function(fname)
  --       return vim.fs.dirname(
    --   vim.fs.find(
    --     { "tsconfig.json", "package.json", ".git" },
    --     { upward = true, path = fname }
    --   )[1]
    -- )
  --   end,
}
vim.lsp.enable("tsserver")


vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.cmd("Copilot disable") -- disable by default

vim.cmd("set list")
vim.cmd("set listchars=tab:▷▷⋮")

-- theme
vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme retrobox")
-- vim.cmd("colorscheme unokai")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fk", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>h", function()
  vim.lsp.buf.hover()
end, { desc = "Show lsp hover info" })
vim.keymap.set("n", "<leader>e", MiniFiles.open)
vim.keymap.set("n", "<leader>c", function()
    vim.cmd("let @+ = @")
end, { desc = "Copy from default register to clipboard register" })

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>t", "<c-w>s10<c-w>+<c-w>j:term<CR>i", { desc = "Open horizontal terminal" })
vim.keymap.set("n", "<C-w>g", "<c-w>v<c-w>l:term<CR>i", { desc = "Open vertical terminal" })

