-- ~/.config/nvim/lua/lazy.lua

-- Cheque se lazy.nvim está instalado, se não, instale-o
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Função para carregar plugins dinamicamente
local function load_plugins()
  local plugins = {}
  local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/plugins', '*.lua', false, true)
  for _, file in ipairs(plugin_files) do
    --    print("Loading plugin: " .. file)  -- Adicione esta linha para depuração
    local plugin = dofile(file)
    table.insert(plugins, plugin)
  end
  return plugins
end

-- Configure lazy.nvim
print("Configuring lazy.nvim") -- Adicione esta linha para depuração
require('lazy').setup({
  spec = load_plugins(),
})
--print("lazy.nvim configured")  -- Adicione esta linha para depuração
