-- ~/.config/nvim/lua/diagnostics.lua

return {
  settings = {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = ""
    },
    signs_define = {
      DiagnosticSignError = { text = "", texthl = "DiagnosticSignError" },
      DiagnosticSignWarn = { text = "󰗖", texthl = "DiagnosticSignWarn" },
      DiagnosticSignInfo = { text = "", texthl = "DiagnosticSignInfo" },
      DiagnosticSignHint = { text = "󱩎", texthl = "DiagnosticSignHint" },
    }
  },
  languages = {
    javascript = {'biome'},
    typescript = {'biome'},
    typescriptreact = {'biome'},
    javascriptreact = {'biome'},
    html = {'prettier'},
    css = {'prettier'},
  }
}

