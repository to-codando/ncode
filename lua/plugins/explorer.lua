return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          file_ignore_patterns = {},  -- Certifique-se de que essa configuração esteja vazia se você não quiser ignorar nenhum arquivo
          hidden = true,  -- Habilita a exibição de arquivos ocultos
        },
        pickers = {
          find_files = {
            hidden = true,  -- Inclui arquivos ocultos na pesquisa de arquivos
          },
        },
      })
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('nvim-tree').setup({
        renderer = {
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              git = {
                unstaged = "⏺",
                staged = "",
                unmerged = "",
                renamed = "󰷉",
                deleted = "",
                untracked = "",
                ignored = "",
              },
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
            },
          },
        },
        view = {
          float = {
            enable = false,
            open_win_config = {
              relative = 'editor',
              border = 'rounded',
            },
          },
          width = 30,
          side = 'left',
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = false,
        update_cwd = false,
        diagnostics = {
          enable = false,
        },
        update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {}
        },
        system_open = {
          cmd = nil,
          args = {}
        },
        filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
        },
      })
    end
  }
}

