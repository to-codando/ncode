-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
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
              default = "", -- Ícone para arquivos padrão
              symlink = "", -- Ícone para symlinks
              git = {
                unstaged = "⏺", -- Ícone para arquivos não stageados
                staged = "", -- Ícone para arquivos stageados
                unmerged = "", -- Ícone para arquivos não mesclados
                renamed = "󰷉", -- Ícone para arquivos renomeados
                deleted = "", -- Ícone para arquivos deletados
                untracked = "", -- Ícone para arquivos não rastreados
                ignored = "", -- Ícone para arquivos ignorados
              },
              folder = {
                default = "", -- Ícone para pastas padrão
                open = "", -- Ícone para pastas abertas
                empty = "", -- Ícone para pastas vazias
                empty_open = "", -- Ícone para pastas vazias abertas
                symlink = "", -- Ícone para symlinks de pasta
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
