local utils = require('utils')
return {
  ["<leader>ks"] = { "<cmd>w<CR>", "Search keymaps", mode = "n" },

  ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Explorer", mode = "n" },
  ["<leader>er"] = { "<cmd>NvimTreeRename<CR>", "Rename", mode = "n" },
  ["<leader>ec"] = { "<cmd>NvimTreeCopy<CR>", "Copy", mode = "n" },
  ["<leader>em"] = { "<cmd>NvimTreeMove<CR>", "Move", mode = "n" },
  ["<leader>ea"] = { "<cmd>NvimTreeCreate<CR>", "Create", mode = "n" },
  ["<leader>ed"] = { "<cmd>NvimTreeRemove<CR>", "Delete", mode = "n" },

  -- Basic commands
  ["<leader>w"] = { "<cmd>w<CR>", "Save", mode = "n" },
  ["<leader>q"] = { "<cmd>q<CR>", "Quit", mode = "n" },
  ["<leader>nc"] = { "<cmd>lua require('notify').dismiss()<CR>", "Close notification", mode = "n" },
  ["<leader>bc"] = { "<cmd>enew<CR>", "Create new buffer", mode = "n" },

  -- Window navigation
  ["<leader>a"] = {
    function()
      require("nvim-window").pick()
    end,
    "Navigate between windows (nvim-window)",
    mode = "n"
  },

  -- Window management
  ["<leader>sv"] = { ":vsp<CR>", "Vertical split", mode = "n" },
  ["<leader>sh"] = { ":sp<CR>", "Horizontal split", mode = "n" },
  ["<leader>wr"] = { ":WinResizerStartResize<CR>", "Resize window (WinResizer)", mode = "n" },
  ["<leader>wm"] = { "<cmd>WinShift<CR>", "Activate WinShift", mode = "n" },
  ["<leader>wh"] = { "<cmd>WinShiftLeft<CR>", "Move window left", mode = "n" },
  ["<leader>wj"] = { "<cmd>WinShiftDown<CR>", "Move window down", mode = "n" },
  ["<leader>wk"] = { "<cmd>WinShiftUp<CR>", "Move window up", mode = "n" },
  ["<leader>wl"] = { "<cmd>WinShiftRight<CR>", "Move window right", mode = "n" },
  ["<leader>rh"] = { "<cmd>WinShiftResizeLeft<CR>", "Resize window left", mode = "n" },
  ["<leader>rj"] = { "<cmd>WinShiftResizeDown<CR>", "Resize window down", mode = "n" },
  ["<leader>rk"] = { "<cmd>WinShiftResizeUp<CR>", "Resize window up", mode = "n" },
  ["<leader>rl"] = { "<cmd>WinShiftResizeRight<CR>", "Resize window right", mode = "n" },

  -- Buffer navigation
  ["<leader>bn"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer", mode = "n" },
  ["<leader>bp"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer", mode = "n" },
  ["<leader>bj"] = { "<cmd>BufferLinePick<CR>", "Pick buffer", mode = "n" },
  ["<leader>bq"] = { "<cmd>BufferLinePickClose<CR>", "Pick and close buffer", mode = "n" },
  ["<leader>br"] = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the right", mode = "n" },
  ["<leader>bl"] = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the left", mode = "n" },
  ["<leader>bo"] = { "<cmd>BufferLineCloseOthers<CR>", "Close other buffers", mode = "n" },
  ["<leader>b1"] = { "<cmd>BufferGoto 1<CR>", "Go to buffer 1", mode = "n" },
  ["<leader>b2"] = { "<cmd>BufferGoto 2<CR>", "Go to buffer 2", mode = "n" },
  ["<leader>b3"] = { "<cmd>BufferGoto 3<CR>", "Go to buffer 3", mode = "n" },
  ["<leader>b4"] = { "<cmd>BufferGoto 4<CR>", "Go to buffer 4", mode = "n" },
  ["<leader>b5"] = { "<cmd>BufferGoto 5<CR>", "Go to buffer 5", mode = "n" },
  ["<leader>b6"] = { "<cmd>BufferGoto 6<CR>", "Go to buffer 6", mode = "n" },
  ["<leader>b7"] = { "<cmd>BufferGoto 7<CR>", "Go to buffer 7", mode = "n" },
  ["<leader>b8"] = { "<cmd>BufferGoto 8<CR>", "Go to buffer 8", mode = "n" },
  ["<leader>b9"] = { "<cmd>BufferGoto 9<CR>", "Go to buffer 9", mode = "n" },
  ["<leader>b0"] = { "<cmd>BufferGoto 10<CR>", "Go to buffer 10", mode = "n" },

  -- Telescope
  ["<leader>ff"] = {
    function()
      require("telescope.builtin").find_files()
    end,
    "Find files (Telescope)",
    mode = "n"
  },
  ["<leader>fg"] = {
    function()
      require("telescope.builtin").live_grep()
    end,
    "Live grep (Telescope)",
    mode = "n"
  },
  ["<leader>fb"] = {
    function()
      require("telescope.builtin").buffers()
    end,
    "List buffers (Telescope)",
    mode = "n"
  },
  ["<leader>fh"] = {
    function()
      require("telescope.builtin").help_tags()
    end,
    "Help tags (Telescope)",
    mode = "n"
  },

  -- Harpoon
  ["<leader>fa"] = {
    function()
      require("harpoon").mark.add_file()
    end,
    "Add file to Harpoon",
    mode = "n"
  },
  ["<leader>fe"] = {
    function()
      require("harpoon").ui.toggle_quick_menu()
    end,
    "Toggle Harpoon quick menu",
    mode = "n"
  },
  ["<leader>f1"] = {
    function()
      require("harpoon").ui.nav_file(1)
    end,
    "Navigate to file 1 in Harpoon",
    mode = "n"
  },
  ["<leader>f2"] = {
    function()
      require("harpoon").ui.nav_file(2)
    end,
    "Navigate to file 2 in Harpoon",
    mode = "n"
  },
  ["<leader>f3"] = {
    function()
      require("harpoon").ui.nav_file(3)
    end,
    "Navigate to file 3 in Harpoon",
    mode = "n"
  },
  ["<leader>f4"] = {
    function()
      require("harpoon").ui.nav_file(4)
    end,
    "Navigate to file 4 in Harpoon",
    mode = "n"
  },
  ["<leader>fp"] = {
    function()
      require("harpoon").ui.nav_prev()
    end,
    "Navigate to previous file in Harpoon",
    mode = "n"
  },
  ["<leader>fn"] = {
    function()
      require("harpoon").ui.nav_next()
    end,
    "Navigate to next file in Harpoon",
    mode = "n"
  },

  -- Comments
  ["<leader>cc"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Toggle line comment", mode = "n" },
  ["<leader>cb"] = { "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>", "Toggle block comment", mode = "n" },
  ["<leader>cu"] = { "<cmd>lua require('Comment.api').unlock.current()<CR>", "Unlock line comment", mode = "n" },

-- LSP
  ["gd"] = {
    function() vim.lsp.buf.definition() end,
    desc = "Go to definition (LSP)",
    mode = "n"
  },
  ["gr"] = {
    function() vim.lsp.buf.references() end,
    desc = "References (LSP)",
    mode = "n"
  },
  ["gi"] = {
    function() vim.lsp.buf.implementation() end,
    desc = "Go to implementation (LSP)",
    mode = "n"
  },
  ["<leader>rn"] = {
    function() vim.lsp.buf.rename() end,
    desc = "Rename (LSP)",
    mode = "n"
  },
  ["<leader>ca"] = {
    function() vim.lsp.buf.code_action() end,
    desc = "Code action (LSP)",
    mode = "n"
  },
  ["<leader>f"] = {
    function() vim.lsp.buf.format() end,
    desc = "Format (LSP)",
    mode = "n"
  },
  ["<leader>ce"] = {
    function() vim.diagnostic.open_float() end,
    desc = "Open floating error",
    mode = "n"
  },
  ["[d"] = {
    function() vim.diagnostic.goto_prev() end,
    desc = "Go to previous error",
    mode = "n"
  },
  ["]d"] = {
    function() vim.diagnostic.goto_next() end,
    desc = "Go to next error",
    mode = "n"
  },

  -- Troubles
  ["<leader>xx"] = {
    "<cmd>Trouble diagnostics toggle<CR>",
    desc = "Open/close Trouble",
    mode = "n"
  },

  -- TypeScript tools (comentado)
  -- ["<leader>oi"] = {
  --   ":TSToolsOrganizeImports<CR>",
  --   desc = "Organize imports (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>si"] = {
  --   ":TSToolsSortImports<CR>",
  --   desc = "Sort imports (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>ri"] = {
  --   ":TSToolsRemoveUnusedImports<CR>",
  --   desc = "Remove unused imports (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>ru"] = {
  --   ":TSToolsRemoveUnused<CR>",
  --   desc = "Remove unused code (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>ai"] = {
  --   ":TSToolsAddMissingImports<CR>",
  --   desc = "Add missing imports (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>fa"] = {
  --   ":TSToolsFixAll<CR>",
  --   desc = "Fix all errors (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>gsd"] = {
  --   ":TSToolsGoToSourceDefinition<CR>",
  --   desc = "Go to source definition (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>rf"] = {
  --   ":TSToolsRenameFile<CR>",
  --   desc = "Rename file (TypeScript)",
  --   mode = "n"
  -- },
  -- ["<leader>fr"] = {
  --   ":TSToolsFileReferences<CR>",
  --   desc = "Find file references (TypeScript)",
  --   mode = "n"
  -- },

  -- Autocomplete (cmp)
  ["<C-n>"] = {
    function() require("cmp").mapping.select_next_item() end,
    desc = "Next item in suggestion list",
    mode = "i"
  },
  ["<C-p>"] = {
    function() require("cmp").mapping.select_prev_item() end,
    desc = "Previous item in suggestion list",
    mode = "i"
  },
  ["<C-e>"] = {
    function() require("cmp").mapping.close() end,
    desc = "Close suggestion window",
    mode = "i"
  },

  -- Emmet
  ["<C-y>"] = {
    "<Plug>(emmet-expand-abbr)",
    desc = "Expand Emmet abbreviation",
    mode = "i"
  },
}

-- utils.set_keymaps(M.keymaps)

-- wk.register({ keymaps })

