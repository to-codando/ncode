-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local otter = require('otter')
      local function activate_otter()
        otter.activate({ filetype = "ts" })
      end
      otter.setup({
        -- Configuração para o tipo de arquivo `.custom`
        filetypes = {
          typescript = {
            embedded_languages = {
              html = true,
              javascript = true,
              mdx = true,
              jsx = true,
              tsx = true,
              css = true,
            },
          },
          custom_syntax = {
            ["css`"] = "css",
            ["jsx`"] = "jsx",
            ["tsx`"] = "tsx",
            ["html`"] = "tsx",
          },
        },
      })
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.ts",
        callback = function()
          require('otter').activate({ filetype = "typescript" })
        end,
      })
    end
  },
  {
    'maxmellon/vim-jsx-pretty',
    ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }, -- Garante que o plugin seja carregado para esses tipos de arquivo
    config = function()
      -- Configurações específicas do vim-jsx-pretty
      vim.g.vim_jsx_pretty_template_tags = { 'html', 'jsx', 'tsx', 'mdx' } -- Habilita destaque de JSX dentro de literais de template
      vim.g.vim_jsx_pretty_disable_js = 0                                  -- Não desabilitar destaque para arquivos js
      vim.g.vim_jsx_pretty_disable_tsx = 0                                 -- Não desabilitar destaque para arquivos tsx
      vim.g.vim_jsx_pretty_colorful_config = 1                             -- Habilita configuração colorida (opcional)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local ts_config = require("nvim-treesitter.configs")
      ts_config.setup({
        ensure_installed = {
          "typescript",
          "javascript",
          "tsx",
          "html",
          "css",
          "scss",
          "astro",
          "angular",
          "vue",
          "lua",
          "rust",
          "php",
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
          enable = false,
        },
        playground = {
          enable = true,
        },
        injection = {
          enable = true,
        },
      })
    end,
  },
}
