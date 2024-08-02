-- ~/.config/nvim/lua/autocmds.lua

-- Formatação automática ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.html", "*.css", "*.lua" },
  callback = function()
    -- Temporariamente define o buftype para ""
    local current_buftype = vim.bo.buftype
    if current_buftype ~= "" then
      vim.bo.buftype = ""
      vim.cmd('write')
      vim.bo.buftype = current_buftype
    else
      vim.cmd('write')
    end
  end,
  group = augroup,
})
