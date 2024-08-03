return {
  'folke/neodev.nvim',
  dependencies = {'rcarriga/nvim-dap-ui'},
  config = function()
    require("neodev").setup({
      -- Configurações específicas
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
  end
}
