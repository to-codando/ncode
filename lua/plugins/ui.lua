-- ~/.config/nvim/lua/plugins/ui.lua

return {
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
  --  enabled = false,
    config = function()
    local notify = require("notify")

    -- Configuração básica
    notify.setup({
      stages = "slide",
      timeout = 1000, -- Tempo em milissegundos
      background_colour = "#000000",
    })

    -- Suprime os warnings
    vim.notify = function(msg, level, opts)
      if level == "WARN" then
        return -- Não exibe warnings
      end
      notify(msg, level, opts)
    end
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
    local noice = require("noice")
    noice.setup({
      -- Configuração para suprimir warnings
      lsp = {
        signature = {
          enabled = false, -- Desativa a exibição de assinaturas de função
        },
        progress = {
          enabled = false, -- Desativa a exibição de progresso do LSP
        },
        hover = {
          enabled = false, -- Desativa a exibição de hover do LSP
        },
        message = {
          enabled = false, -- Desativa a exibição de mensagens do LSP
        },
        diagnostic = {
          enabled = false, -- Desativa a exibição de diagnósticos (warnings e erros)
        }
      },
      messages = {
        enabled = true, -- Exibe mensagens de erro
        view = "notify", -- Redireciona mensagens para o nvim-notify
      },
      notify = {
        -- Integração com nvim-notify
        enabled = true,
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
          notify = true,
          noice = true,
          which_key = true,
          dashboard = true,
          cmp = true,
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


