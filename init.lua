-- ~/.config/nvim/init.lua

-- Adicione o caminho 'lua' ao runtime path
--vim.cmd('set runtimepath+=~/.config/nvim/lua')

-- Carregue a configuração dos plugins
require('lazy_setup')
require('reset')
require('lsps')
require('diagnostics')
require('keymaps')
require('autocmds')
