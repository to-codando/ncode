-- ~/.config/nvim/lua/plugins/comment.lua
-- ~/.config/nvim/lua/plugins/comment.lua
return {
  'terrortylor/nvim-comment',
  event = "VeryLazy",
  config = function()
    require('nvim_comment').setup({
      -- Altere as opções aqui conforme necessário
      marker_padding = true,
      comment_empty = false,
      create_mappings = true,
    })
  end
}

