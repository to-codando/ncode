return {

  lsps = {
    servers = {
      'html',
      'cssls',
      'lua_ls',
      'biome'
    },
    settings = {
      html = {},
      cssls = {},
      lua_ls = {},
      pyright = {},
      rust_analyzer = {},
      biome = {}
    },

  },

  diagnostics = {
    -- settings = {
    -- virtual_text = false,
    --signs = true,
    -- update_in_insert = false,
    -- underline = true,
    -- severity_sort = true,
    -- float = {
    -- focusable = false,
    -- style = "minimal",
    -- border = "rounded",
    -- source = "always",
    -- header = "",
    -- prefix = ""
    -- },
    signs = {
      { name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError" },
      { name = "DiagnosticSignWarn", text = "󰗖", texthl = "DiagnosticSignWarn" },
      { name = "DiagnosticSignInfo", text = "", texthl = "DiagnosticSignInfo" },
      { name = "DiagnosticSignHint", text = "󱩎", texthl = "DiagnosticSignHint" },
    },
  },
  -- languages = {
  -- javascript = {'biome'},
  -- typescript = {'biome'},
  -- typescriptreact = {'biome'},
  -- javascriptreact = {'biome'},
  -- html = {'prettier'},
  -- css = {'prettier'},
  -- }
  -- },
  debuggers = {},


  -- keymaps = {},

  -- autocmds = {}

}
