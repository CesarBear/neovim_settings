return {
  "lervag/vimtex",
  lazy = false,
  init = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'texshop'
      vim.g.vimtex_view_automatic = 0
      vim.g.vimtex_view_texshop_activate = 1
  end,
}
