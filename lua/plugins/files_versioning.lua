-- ~/.config/nvim/lua/files_versioning.lua
return {
  -- Git-blame.nvim
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_date_format = "%Y-%m-%d"
      vim.g.gitblame_message_template = "<author> • <date> • <summary>"
    end,
    lazy = true, -- Carregar sob demanda
  },

  -- Gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
        },
        current_line_blame = false, -- Exibe o blame na linha atual
        current_line_blame_opts = {
          delay = 500,              -- Tempo de atraso para o blame
        },
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
      })
    end,
    lazy = true, -- Carregar sob demanda
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- necessário
      "sindrets/diffview.nvim",        -- integração opcional com Diffview
      "nvim-telescope/telescope.nvim", -- integração opcional com Telescope
      "ibhagwan/fzf-lua",              -- integração opcional com FZF
    },
    config = function()
      local neogit = require('neogit')
      neogit.setup({
        integrations = {
          diffview = true,                  -- Ativa integração com Diffview
          telescope = false,                -- Desativa integração com Telescope se não for necessário
          fzf = false,                      -- Desativa integração com FZF se não for necessário
        },
        disable_commit_confirmation = true, -- Desativa confirmação para maior fluidez
        auto_refresh = true,
        commit_popup = {
          kind = 'split' -- Abre o popup de commit em uma divisão
        }
      })
    end,
    lazy = true, -- Carregar sob demanda
  },

  -- Diffview.nvim
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('diffview').setup({
        enhanced_diff_hl = true,
        use_icons = true,
        file_panel = {
          width = 35,
        },
        keymaps = {
          view = {
            ["l"] = "<cmd>DiffviewSelectNextEntry<CR>",
            ["h"] = "<cmd>DiffviewSelectPrevEntry<CR>",
            ["q"] = "<cmd>DiffviewClose<CR>",
          },
          file_panel = {
            ["j"] = "<cmd>DiffviewNextEntry<CR>",
            ["k"] = "<cmd>DiffviewPrevEntry<CR>",
            ["q"] = "<cmd>DiffviewClose<CR>",
          },
        },
      })
    end,
    lazy = true, -- Carregar sob demanda
  },
}

