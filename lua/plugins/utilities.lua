-- ~/.config/nvim/lua/plugins/utilities.lua
return {
  {
    'NvChad/nvim-colorizer.lua'
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    -- Calling setup is optional.
    config = function()
      require("ssr").setup {
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        adjust_window = true,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      }
    end
  },
  {
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local ctactions = require("cheatsheet.telescope.actions")
      require("cheatsheet").setup({
        bundled_cheetsheets = {
          enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
          disabled = { "nerd-fonts" },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            "auto-session",
            "goto-preview",
            "octo.nvim",
            "telescope.nvim",
            "vim-easy-align",
            "vim-sandwich",
          },
          disabled = { "gitsigns" },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ["<CR>"] = ctactions.select_or_fill_commandline,
          ["<A-CR>"] = ctactions.select_or_execute,
          ["<C-Y>"] = ctactions.copy_cheat_value,
          ["<C-E>"] = ctactions.edit_user_cheatsheet,
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      -- Carregue o plugin
      local wk = require("which-key")
      local maps = require('keymaps')

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
      wk.register(maps, { prefix = "" })
    end
  }
}
