local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local M = {}

local function search_keymaps(keymaps)
  local keymaps_list = {}
  for mode, mappings in pairs(keymaps) do
    for lhs, map in pairs(mappings) do
      table.insert(keymaps_list, {
        mode = mode,
        lhs = lhs,
        rhs = map.rhs,
        desc = map.desc
      })
    end
  end

  local opts = {
    prompt_title = 'Keymaps',
    finder = finders.new_table {
      results = keymaps_list,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.lhs .. ' -> ' .. entry.desc,
          ordinal = entry.lhs .. ' ' .. entry.desc,
        }
      end
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        print(vim.inspect(selection.value))
      end)
      return true
    end,
  }
  pickers.new({}, opts):find()
end

-- vim.keymap.set('n', '<leader>ks', search_keymaps, { noremap = true, silent = true })

M.search_keymaps = search_keymaps
return M
