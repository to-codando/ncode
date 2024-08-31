-- ~/.config/nvim/lua/plugins/utilities.lua
return {
  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
    config = function()
      vim.g.editorconfig = true
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require('colorizer').setup({
        '*',             -- Highlight all files
      }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Name" codes like "red" or "blue"
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        css = true,      -- Enable all CSS features
        css_fn = true,   -- Enable all CSS features
      })
    end,
  },
  {
    "neph-iap/easycolor.nvim",
    dependencies = { "stevearc/dressing.nvim" }, -- Dependência opcional
    event = "VeryLazy",
    opts = {},
    keys = { { "<leader>b", "<cmd>EasyColor<cr>", desc = "Color Picker" } }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      -- Carregue o plugin
      local wk = require("which-key")

      -- Configure o which-key
      wk.setup({
        -- Escolha o layout (opções: "classic", "modern", "helix")
        preset = "modern",
        -- Tempo de delay antes de mostrar o popup
        delay = 200,

        -- Filtros para as mappings
        filter = function(mapping)
          return true
        end,

        -- Plugins habilitados
        plugins = {
          marks = true,
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
        sort = { "order" },

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
            { "^%+",              "" },
            { "<[cC]md>",         "" },
            { "<[cC][rR]>",       "" },
            { "<[sS]ilent>",      "" },
            { "^lua%s+",          "" },
            { "^call%s+",         "" },
            { "^:%s*",            "" },
          },
        },

        -- Configurações de ícones
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
          ellipsis = "…",
          mappings = false,
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
        notify = false,
      })
    end
  }
}
