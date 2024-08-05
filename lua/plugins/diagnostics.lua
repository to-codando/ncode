local user_settings_path = vim.fn.stdpath('config') .. '/settings.lua'
local user_settings = loadfile(user_settings_path)() or {}
local default_diagnostics = require("diagnostics")

local utils = require("utils")

-- Mescla configurações padrão e do usuário
local diagnostics_config = vim.deepcopy(default_diagnostics)
utils.merge_tables(diagnostics_config, user_settings.diagnostics or {})

return {
   {
    "nvimtools/none-ls.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      local none_ls = require("null-ls")

      local sources = {}

      -- Itera sobre as linguagens e aplica formatadores e linters
      for filetype, tools in pairs(diagnostics_config.languages) do
        for _, tool in ipairs(tools) do
          local builtin_tool = none_ls.builtins.formatting[tool] or none_ls.builtins.diagnostics[tool]
          if builtin_tool then
            table.insert(sources, builtin_tool.with({
              filetypes = {filetype},
            }))
          end
        end
      end

      none_ls.setup({
        sources = sources,
      })


    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configura os servidores LSP
      for _, server in ipairs(diagnostics_config.servers or {}) do
        local opts = diagnostics_config.settings and diagnostics_config.settings[server] or {}
        lspconfig[server].setup(opts)
      end

      -- Configuração dos ícones de diagnóstico
      if diagnostics_config.settings then
        for sign, config in pairs(diagnostics_config.settings.signs_define or {}) do
          vim.fn.sign_define(sign, config)
        end

        -- Configuração dos diagnósticos
        vim.diagnostic.config(vim.tbl_extend("force",  {}, diagnostics_config.settings))
      end
    end,
  },
}

