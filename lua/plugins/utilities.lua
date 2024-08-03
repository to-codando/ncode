-- ~/.config/nvim/lua/plugins.lua
-- ~/.config/nvim/lua/plugins.lua
return {
  -- Outros plugins
  {
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Carregar o plugin quando necessário
    config = function()
      require('which-key').setup({
        -- Exemplo de configuração
        plugins = {
          spelling = {
            enabled = true, -- Enable spelling suggestions
            suggestions = 20, -- Number of suggestions to show
          },

        },
        key_labels = {
          -- Define labels for different keymaps
          ["<leader>"] = "Leader",
        },
        operators = { gc = "Comments" },
        icons = {
          breadcrumb = "»", -- Icon used for breadcrumb
          separator = "➜", -- Icon used for separator
          group = "+", -- Icon used for group
        },
      })
    end
  }
}

