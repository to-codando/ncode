-- ~/.config/nvim/lua/plugins/lsps.lua

local user_settings_path = vim.fn.stdpath('config') .. '/settings.lua'
local user_settings = loadfile(user_settings_path)() or {}
local default_lsps = require("lsps")
local utils = require("utils")

-- Mescla configurações padrão e do usuário
local lsps_config = vim.deepcopy(default_lsps)
utils.merge_tables(lsps_config, user_settings.lsps or {})

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim'
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = lsps_config.servers or {},
      })

      mason_lspconfig.setup_handlers({
        function(server)
          local lspconfig = require("lspconfig")
          local opts = lsps_config.settings and lsps_config.settings[server] or {}
          
          -- Configura o servidor LSP
          lspconfig[server].setup(opts)
        end,
      })
    end,
  },
}

