-- ~/.config/nvim/lua/lsps.lua

return {
  servers = {'html', 'cssls', 'tsserver', 'lua_ls', 'biome'}, -- servidores lsp padrão
  settings = {
    html = {
      -- Configurações adicionais para html
    },
    cssls = {
      -- Configurações adicionais para cssls
    },
    tsserver = {
      on_attach = function(client, bufnr)
        local tsserver_settings = {
          preferences = {
            importModuleSpecifierPreference = "relative",
          },
        }

        client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, tsserver_settings)

        -- Configuração para resolver aliases de módulo
        client.config.settings.typescript = client.config.settings.typescript or {}
        client.config.settings.typescript.preferences = client.config.settings.typescript.preferences or {}
        client.config.settings.typescript.preferences.importModuleSpecifierPreference = "relative"
      end,
    },
    lua_ls = {
      -- Configurações adicionais para lua_ls
    },
    emmet_ls = {},
    biome = {},

  }
}

