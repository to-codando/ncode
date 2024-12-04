return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 100, -- Ensure it loads first
    config = function()
      vim.cmd("colorscheme onedark")
    end
  },


}
