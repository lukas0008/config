return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  ensure_installed = { 'c', 'lua', 'markdown', 'markdown_inline', 'rust', 'javascript', 'typescript' },
}
