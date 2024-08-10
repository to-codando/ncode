-- ~/.config/nvim/lua/plugins/nvim-web-devicons.lua

return {
  'echasnovski/mini.nvim',
  'ryanoasis/vim-devicons',
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup { default = true, }
  end
}
