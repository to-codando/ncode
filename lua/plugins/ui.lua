-- ~/.config/nvim/lua/plugins/ui.lua

return {
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
  --  enabled = false,
    config = function()
      require('notify').setup({
        timeout = 2000, -- Ajuste o tempo de exibição em milissegundos
        stage = 'slide'
      })
      vim.notify = require('notify')
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require('noice').setup({
        lsp = {
          hover = {
            enabled = false,
          },
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",   -- Escolha o sabor: latte, frappe, macchiato, mocha
        integrations = {
          bufferline = true, -- Habilite a integração com bufferline
          dap = {
            enabled = true, -- Habilite a integração com o DAP
            -- Personalize a aparência do DAP aqui
          },
        },
        highlight_overrides = {
          all = function(colors)
            return {
              -- Personalize a aparência do bufferline aqui
              BufferCurrent = { bg = colors.surface0, fg = colors.text },
              BufferCurrentSign = { bg = colors.surface0, fg = colors.green },
              BufferCurrentMod = { bg = colors.surface0, fg = colors.yellow },
              BufferInactive = { bg = colors.surface1, fg = colors.overlay0 },
              BufferInactiveSign = { bg = colors.surface1, fg = colors.overlay0 },
              BufferInactiveMod = { bg = colors.surface1, fg = colors.yellow },
              BufferTabpages = { bg = colors.surface1, fg = colors.text },

              -- Personalize as cores do DAP para combinar com o Catppuccin
              DapBreakpoint = { fg = colors.red, bg = colors.none },
              DapBreakpointCondition = { fg = colors.yellow, bg = colors.none },
              DapLogPoint = { fg = colors.green, bg = colors.none },
              DapStopped = { fg = colors.blue, bg = colors.none },


              -- Ajustes para o menu
              MenuItem = { bg = colors.surface1, fg = colors.text },
              MenuItemSelected = { bg = colors.mantle, fg = colors.green },
              MenuItemHighlight = { bg = colors.base, fg = colors.green },
            }
          end,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}


