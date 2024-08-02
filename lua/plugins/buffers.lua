-- ~/.config/nvim/lua/plugins/buffers.lua

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('bufferline').setup {
        options = {
          mode = "buffers",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            style = "icon",
            icon = "▎",
          },
          buffer_close_icon = '✖',
          modified_icon = "●",
          close_icon = '✖',
          left_trunc_marker = "",
          right_trunc_marker = "",
          name_formatter = function(buf)
            local path = vim.fn.fnamemodify(buf.path, ':p')
            local folder = vim.fn.fnamemodify(path, ':h')
            local file_name = vim.fn.fnamemodify(path, ':t')
            local parent_folder = vim.fn.fnamemodify(folder, ':t')
            if parent_folder ~= '' and parent_folder ~= '.' then
              return parent_folder .. '/' .. file_name
            else
              return file_name
            end
          end,
          max_name_length = 30,
          max_prefix_length = 20,
          tab_size = 0,
          diagnostics = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          separator_style = 'slant',
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          get_element_icon = function(buf)
            local devicons = require('nvim-web-devicons')
            local icon, icon_highlight = devicons.get_icon(buf.name, buf.filetype, { default = false })
            return icon, icon_highlight
          end,
        }
      }
    end,
  },
}
