-- ~/.config/nvim/lua/lsps.lua

return {
  servers = {
    "html",
    "cssls",
    "emmet_ls",
    "tsserver",
    "lua_ls",
  }, -- servidores lsp padrão
  settings = {
    html = {},
    cssls = {},
    tsserver = {
      on_attach = function(client, bufnr)
        -- Desativar formatação automática e linting
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        client.server_capabilities.codeActionProvider = true
        client.server_capabilities.hoverProvider = true
      end,
      settings = {
        tsserver = {
          diagnostic = false -- Desativa o linting do tsserver
        }
      }
    },
    lua_ls = {},
    emmet_ls = {
      filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "php", "angular", "vue", "svelte" }, -- Adicione ou remova conforme necessário
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true, -- Exemplo de configuração do Emmet
          },
        },
      },
    },
  },
}
