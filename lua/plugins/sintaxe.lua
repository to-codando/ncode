-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
-- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
-- {'neovim/nvim-lspconfig'},
-- {'hrsh7th/cmp-nvim-lsp'},
-- {'hrsh7th/nvim-cmp'},
-- {'L3MON4D3/LuaSnip'},
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      local ts_config = require('nvim-treesitter.configs')
      ts_config.setup({
        ensure_installed = {
          "typescript", "javascript", "tsx", "html", "css", "lua", "rust", "php"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        autotag = {
          enable = true,
        },
        -- Configura linguagens injetadas
        playground = {
          enable = true,
        },
        injection = {
          enable = true,
        },

      })
    end
  },
}
