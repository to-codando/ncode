-- ~/.config/nvim/lua/plugins/comment.lua
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      --- Ativar mapeamentos básicos e extras
      mappings = {
        basic = true,   -- Mapeamentos básicos
        extra = true,   -- Mapeamentos extras
        extended = true -- Desativa mapeamentos estendidos se não forem necessários
      },
      --- Define o pré-hook para personalizar a string de comentário, removendo dependência do `ts_context_commentstring`
      pre_hook = nil,
      post_hook = nil
    })
  end
}
