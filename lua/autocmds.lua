-- ~/.config/nvim/lua/autocmds.lua
-- Carregue o módulo update
local utils = require('utils')

-- Crie um autocomando para atualizar quando arquivos de configuração forem modificados


vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsStartingInstall',
  callback = function()
    vim.schedule(function()
      print('mason-tool-installer is starting')
    end)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function(e)
    vim.schedule(function()
      print(vim.inspect(e.data))
    end)
  end,
})
