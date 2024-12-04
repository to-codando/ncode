return {
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      local nvimtree = require("nvim-tree")
      nvimtree.setup({
        view = {
          width = 30, -- Define a largura da árvore de arquivos
          side = "left",
        },
        renderer = {
          group_empty = false,
          highlight_opened_files = "all",
          root_folder_label = false,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = false,
            },
          },
        },


      })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            ".git", "node_modules", ".cache", "dist"
          },
          hidden = true,
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end
  },
}
