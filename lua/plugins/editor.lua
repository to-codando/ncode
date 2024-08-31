-- lua/plugins/editor.lua
return {
  { 'mg979/vim-visual-multi' },
  {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup {
        -- Suas configurações aqui (opcional)
        map_defaults = false,      -- desativa os mapeamentos padrão para criar os seus próprios
        reindent = true,           -- reindenta as linhas movidas
        undojoin = true,           -- mantém o histórico de desfazer em uma única ação
        move_past_end_col = false, -- evita mover blocos para além da última coluna
      }
    end,
  },
}
