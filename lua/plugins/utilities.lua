-- ~/.config/nvim/lua/plugins/utilities.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    -- Carregue o plugin
    local wk = require("which-key")
    local maps = require('keymaps')
    local utils = require('utils')

    -- Configure o which-key
    wk.setup({
      -- Escolha o layout (opções: "classic", "modern", "helix")
      preset = "classic",

      -- Tempo de delay antes de mostrar o popup
      delay = 200,

      -- Filtros para as mappings
      filter = function(mapping)
        return true
      end,

      -- Plugins habilitados
      plugins = {
        marks = false,
        registers = true,
        spelling = {
          enabled = false,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },

      -- Opções da janela
      win = {
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        zindex = 1000,
      },

      -- Layout da janela
      layout = {
        width = { min = 20 },
        spacing = 3,
      },

      -- Mapeamentos de teclas
      keys = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },

      -- Ordenação dos mapeamentos
      sort = { "local", "order", "group", "alphanum", "mod" },

      -- Expansão dos grupos
      expand = 0,

      -- Substituições de ícones e formatação
      replace = {
        key = {
          function(key)
            return require("which-key.view").format(key)
          end,
        },
        desc = {
          { "<Plug>%(?(.*)%)?", "%1" },
          { "^%+", "" },
          { "<[cC]md>", "" },
          { "<[cC][rR]>", "" },
          { "<[sS]ilent>", "" },
          { "^lua%s+", "" },
          { "^call%s+", "" },
          { "^:%s*", "" },
        },
      },

      -- Configurações de ícones
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
        mappings = true,
        colors = true,
      },

      show_help = true,
      show_keys = true,

      -- Desabilitar WhichKey para certos tipos de buffer e arquivos
      disable = {
        ft = {},
        bt = {},
      },

      debug = false,
    })
    wk.register(maps)
  end
}

