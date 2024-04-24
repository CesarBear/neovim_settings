return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      size = 20,
      hide_number = true,
      direction = 'float',
      shell = vim.o.shell,
      shade_terminals = true,
      shading_factor = 20
    })
  end
}
