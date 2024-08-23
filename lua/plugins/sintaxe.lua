-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
    config = function()
      vim.g.editorconfig = true
    end,
  },
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local otter = require('otter')
      local function activate_otter()
        otter.activate()
      end
      otter.setup()
      vim.api.nvim_create_autocmd(
        { "BufRead", "BufNewFile" }, {
          callback = activate_otter,
        })
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
          injections = {
            javascript = {
              ["html"] = {
                query = [[
      (template_string) @html
      ]],
              },
              ["tsx"] = {
                query = [[
      (template_string) @tsx
      ]],
              },
              ["jsx"] = {
                query = [[
      (template_string) @jsx
      ]],
              },
              ["css"] = {
                query = [[
(call_expression
  function: (identifier) @function_name
  arguments: ((template_string) @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.include-children)
    (#set! injection.language "css"))
  (#match? @function_name "css" "keyframes"))
      ]],
              },
            },
            typescript = {
              ["html"] = {
                query = [[
      (template_string) @html
      ]],
              },
              ["tsx"] = {
                query = [[
      (template_string) @tsx
      ]],
              },
              ["css"] = {
                query = [[
(call_expression
  function: (identifier) @function_name
  arguments: ((template_string) @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.include-children)
    (#set! injection.language "css"))
  (#match? @function_name "css" "keyframes"))
      ]],
              },
            },
          }
        },
      })
    end,
  },
}
