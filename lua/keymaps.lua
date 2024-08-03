local utils = require('utils')
local wk = require('which-key')
local keymaps = {
  -- NvimTree
 n = {
    -- Show all keymaps
    ["<leader>kk"] = { rhs = "<cmd>Legendary<CR>", desc = "Show keymaps" },

    ["<leader>e"] = { rhs = "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" },
    ["<leader>er"] = { rhs = "<cmd>NvimTreeRename<CR>", desc = "Rename" },
    ["<leader>ec"] = { rhs = "<cmd>NvimTreeCopy<CR>", desc = "Copy" },
    ["<leader>em"] = { rhs = "<cmd>NvimTreeMove<CR>", desc = "Move" },
    ["<leader>ea"] = { rhs = "<cmd>NvimTreeCreate<CR>", desc = "Create" },
    ["<leader>ed"] = { rhs = "<cmd>NvimTreeRemove<CR>", desc = "Delete" },

    -- Basic commands
    ["<leader>w"] = { rhs = "<cmd>w<CR>", desc = "Save" },
    ["<leader>q"] = { rhs = "<cmd>q<CR>", desc = "Quit" },
    ["<leader>nc"] = { rhs = "<cmd>lua require('notify').dismiss()<CR>", desc = "Close notification" },
    ["<leader>bc"] = { rhs = "<cmd>enew<CR>", desc = "Create new buffer" },

    -- Window navigation
    ["<leader>a"] = {
      rhs = function()
        require("nvim-window").pick()
      end,
      desc = "Navigate between windows (nvim-window)"
    },

    -- Window management
    ["<leader>sv"] = { rhs = ":vsp<CR>", desc = "Vertical split" },
    ["<leader>sh"] = { rhs = ":sp<CR>", desc = "Horizontal split" },
    ["<leader>wr"] = { rhs = ":WinResizerStartResize<CR>", desc = "Resize window (WinResizer)" },
    ["<leader>wm"] = { rhs = "<cmd>WinShift<CR>", desc = "Activate WinShift" },
    ["<leader>wh"] = { rhs = "<cmd>WinShiftLeft<CR>", desc = "Move window left" },
    ["<leader>wj"] = { rhs = "<cmd>WinShiftDown<CR>", desc = "Move window down" },
    ["<leader>wk"] = { rhs = "<cmd>WinShiftUp<CR>", desc = "Move window up" },
    ["<leader>wl"] = { rhs = "<cmd>WinShiftRight<CR>", desc = "Move window right" },
    ["<leader>rh"] = { rhs = "<cmd>WinShiftResizeLeft<CR>", desc = "Resize window left" },
    ["<leader>rj"] = { rhs = "<cmd>WinShiftResizeDown<CR>", desc = "Resize window down" },
    ["<leader>rk"] = { rhs = "<cmd>WinShiftResizeUp<CR>", desc = "Resize window up" },
    ["<leader>rl"] = { rhs = "<cmd>WinShiftResizeRight<CR>", desc = "Resize window right" },

    -- Buffer navigation
    ["<leader>bn"] = { rhs = "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    ["<leader>bp"] = { rhs = "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    ["<leader>bj"] = { rhs = "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
    ["<leader>bq"] = { rhs = "<cmd>BufferLinePickClose<CR>", desc = "Pick and close buffer" },
    ["<leader>br"] = { rhs = "<cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
    ["<leader>bl"] = { rhs = "<cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
    ["<leader>bo"] = { rhs = "<cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    ["<leader>b1"] = { rhs = "<cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
    ["<leader>b2"] = { rhs = "<cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
    ["<leader>b3"] = { rhs = "<cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
    ["<leader>b4"] = { rhs = "<cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
    ["<leader>b5"] = { rhs = "<cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
    ["<leader>b6"] = { rhs = "<cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
    ["<leader>b7"] = { rhs = "<cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
    ["<leader>b8"] = { rhs = "<cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
    ["<leader>b9"] = { rhs = "<cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
    ["<leader>b0"] = { rhs = "<cmd>BufferGoto 10<CR>", desc = "Go to buffer 10" },

    -- Telescope
    ["<leader>ff"] = {
      rhs = function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files (Telescope)"
    },
    ["<leader>fg"] = {
      rhs = function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep (Telescope)"
    },
    ["<leader>fb"] = {
      rhs = function()
        require("telescope.builtin").buffers()
      end,
      desc = "List buffers (Telescope)"
    },
    ["<leader>fh"] = {
      rhs = function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Help tags (Telescope)"
    },

    -- Harpoon
    ["<leader>fa"] = {
      rhs = function()
        require("harpoon").mark.add_file()
      end,
      desc = "Add file to Harpoon"
    },
    ["<leader>fe"] = {
      rhs = function()
        require("harpoon").ui.toggle_quick_menu()
      end,
      desc = "Toggle Harpoon quick menu"
    },
    ["<leader>f1"] = {
      rhs = function()
        require("harpoon").ui.nav_file(1)
      end,
      desc = "Navigate to file 1 in Harpoon"
    },
    ["<leader>f2"] = {
      rhs = function()
        require("harpoon").ui.nav_file(2)
      end,
      desc = "Navigate to file 2 in Harpoon"
    },
    ["<leader>f3"] = {
      rhs = function()
        require("harpoon").ui.nav_file(3)
      end,
      desc = "Navigate to file 3 in Harpoon"
    },
    ["<leader>f4"] = {
      rhs = function()
        require("harpoon").ui.nav_file(4)
      end,
      desc = "Navigate to file 4 in Harpoon"
    },
    ["<leader>fp"] = {
      rhs = function()
        require("harpoon").ui.nav_prev()
      end,
      desc = "Navigate to previous file in Harpoon"
    },
    ["<leader>fn"] = {
      rhs = function()
        require("harpoon").ui.nav_next()
      end,
      desc = "Navigate to next file in Harpoon"
    },

    -- Comments
    ["<leader>cc"] = { rhs = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle line comment" },
    ["<leader>cb"] = { rhs = "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>", desc = "Toggle block comment" },
    ["<leader>cu"] = { rhs = "<cmd>lua require('Comment.api').unlock.current()<CR>", desc = "Unlock line comment" },

-- LSP
["gd"] = { rhs = vim.lsp.buf.definition, desc = "Go to definition (LSP)" },
["gr"] = { rhs = vim.lsp.buf.references, desc = "References (LSP)" },
["gi"] = { rhs = vim.lsp.buf.implementation, desc = "Go to implementation (LSP)" },
["<leader>rn"] = { rhs = vim.lsp.buf.rename, desc = "Rename (LSP)" },
["<leader>ca"] = { rhs = vim.lsp.buf.code_action, desc = "Code action (LSP)" },
["<leader>f"] = { rhs = vim.lsp.buf.format, desc = "Format (LSP)" },
["<leader>ce"] = { rhs = vim.diagnostic.open_float, desc = "Open floating error" },
["[d"] = { rhs = vim.diagnostic.goto_prev, desc = "Go to previous error" },
["]d"] = { rhs = vim.diagnostic.goto_next, desc = "Go to next error" },

-- Troubles
["<leader>xx"] = { rhs = "<cmd>Trouble diagnostics toggle<CR>", desc = "Open/close Trouble" },

-- TypeScript tools (commented)
-- ["<leader>oi"] = { rhs = ":TSToolsOrganizeImports<CR>", desc = "Organize imports (TypeScript)" },
-- ["<leader>si"] = { rhs = ":TSToolsSortImports<CR>", desc = "Sort imports (TypeScript)" },
-- ["<leader>ri"] = { rhs = ":TSToolsRemoveUnusedImports<CR>", desc = "Remove unused imports (TypeScript)" },
-- ["<leader>ru"] = { rhs = ":TSToolsRemoveUnused<CR>", desc = "Remove unused code (TypeScript)" },
-- ["<leader>ai"] = { rhs = ":TSToolsAddMissingImports<CR>", desc = "Add missing imports (TypeScript)" },
-- ["<leader>fa"] = { rhs = ":TSToolsFixAll<CR>", desc = "Fix all errors (TypeScript)" },
-- ["<leader>gsd"] = { rhs = ":TSToolsGoToSourceDefinition<CR>", desc = "Go to source definition (TypeScript)" },
-- ["<leader>rf"] = { rhs = ":TSToolsRenameFile<CR>", desc = "Rename file (TypeScript)" },
-- ["<leader>fr"] = { rhs = ":TSToolsFileReferences<CR>", desc = "Find file references (TypeScript)" },
  },
-- Autocomplete (cmp)
  i = {
    ["<C-n>"] = { rhs = require("cmp").mapping.select_next_item, desc = "Next item in suggestion list" },
    ["<C-p>"] = { rhs = require("cmp").mapping.select_prev_item, desc = "Previous item in suggestion list" },
    ["<C-e>"] = { rhs = require("cmp").mapping.close, desc = "Close suggestion window" },

    -- Emmet
    ["<C-y>"] = { rhs = "<Plug>(emmet-expand-abbr)", desc = "Expand Emmet abbreviation" },
  },
}


utils.set_keymaps(keymaps)

wk.register({ keymaps })

