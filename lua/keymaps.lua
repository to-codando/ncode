local utils = require('utils')
return {
  ["<leader>ks"] = { "<cmd>w<CR>", "Search keymaps", mode = "n" },

  ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Explorer", mode = "n", group="File Explorer" },
  ["<leader>er"] = { "<cmd>NvimTreeRename<CR>", "Rename", mode = "n", group="File Explorer" },
  ["<leader>ec"] = { "<cmd>NvimTreeCopy<CR>", "Copy", mode = "n", group="File Explorer" },
  ["<leader>em"] = { "<cmd>NvimTreeMove<CR>", "Move", mode = "n", group="File Explorer" },
  ["<leader>ea"] = { "<cmd>NvimTreeCreate<CR>", "Create", mode = "n", group="File Explorer" },
  ["<leader>ed"] = { "<cmd>NvimTreeRemove<CR>", "Delete", mode = "n", group="File Explorer" },

  -- Basic commands
  ["<leader>w"] = { "<cmd>w<CR>", "Save", mode = "n", group="Basics" },
  ["<leader>q"] = { "<cmd>q<CR>", "Quit", mode = "n", group="Basics"},
  ["<leader>nc"] = { "<cmd>lua require('notify').dismiss()<CR>", "Close notification", mode = "n", group="Basics" },
  ["<leader>bc"] = { "<cmd>enew<CR>", "Create new buffer", mode = "n", group="Basics" },

  -- Window navigation
  ["<leader>a"] = {
    function()
      require("nvim-window").pick()
    end,
    "Navigate between windows (nvim-window)",
    mode = "n", 
    group={"Basics", "Windows management", "Windows navigation"}
  },

  -- Window management
  ["<leader>sv"] = { ":vsp<CR>", "Vertical split", mode = "n", group="Windows management" },
  ["<leader>sh"] = { ":sp<CR>", "Horizontal split", mode = "n", group="Windows management" },
  ["<leader>wr"] = { ":WinResizerStartResize<CR>", "Resize window (WinResizer)", mode = "n", group="Windows management" },
  ["<leader>wm"] = { "<cmd>WinShift<CR>", "Activate WinShift", mode = "n", group="Windows management" },
  ["<leader>wh"] = { "<cmd>WinShiftLeft<CR>", "Move window left", mode = "n", group="Windows management" },
  ["<leader>wj"] = { "<cmd>WinShiftDown<CR>", "Move window down", mode = "n", group="Windows management" },
  ["<leader>wk"] = { "<cmd>WinShiftUp<CR>", "Move window up", mode = "n", group="Windows management" },
  ["<leader>wl"] = { "<cmd>WinShiftRight<CR>", "Move window right", mode = "n", group="Windows management" },
  ["<leader>rh"] = { "<cmd>WinShiftResizeLeft<CR>", "Resize window left", mode = "n", group="Windows management" },
  ["<leader>rj"] = { "<cmd>WinShiftResizeDown<CR>", "Resize window down", mode = "n", group="Windows management" },
  ["<leader>rk"] = { "<cmd>WinShiftResizeUp<CR>", "Resize window up", mode = "n", group="Windows management" },
  ["<leader>rl"] = { "<cmd>WinShiftResizeRight<CR>", "Resize window right", mode = "n", group="Windows management" },

  -- Buffer navigation
  ["<leader>bj"] = { "<cmd>BufferLinePick<CR>", "Pick buffer", mode = "n", group="Buffers management" },
  ["<leader>br"] = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the right", mode = "n", group="Buffers management" },
  ["<leader>bl"] = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the left", mode = "n", group="Buffers management" },
  ["<leader>bo"] = { "<cmd>BufferLineCloseOthers<CR>", "Close other buffers", mode = "n", group="Buffers management" },
  
  ["<leader>bn"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer", mode = "n", group="Buffers navigation" },
  ["<leader>bp"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer", mode = "n", group="Buffers navigation" },
  ["<leader>bq"] = { "<cmd>BufferLinePickClose<CR>", "Pick and close buffer", mode = "n", group="Buffers navigation" },
  ["<leader>b1"] = { "<cmd>BufferGoto 1<CR>", "Go to buffer 1", mode = "n", group="Buffers navigation" },
  ["<leader>b2"] = { "<cmd>BufferGoto 2<CR>", "Go to buffer 2", mode = "n", group="Buffers navigation" },
  ["<leader>b3"] = { "<cmd>BufferGoto 3<CR>", "Go to buffer 3", mode = "n", group="Buffers navigation" },
  ["<leader>b4"] = { "<cmd>BufferGoto 4<CR>", "Go to buffer 4", mode = "n", group="Buffers navigation" },
  ["<leader>b5"] = { "<cmd>BufferGoto 5<CR>", "Go to buffer 5", mode = "n", group="Buffers navigation" },
  ["<leader>b6"] = { "<cmd>BufferGoto 6<CR>", "Go to buffer 6", mode = "n", group="Buffers navigation" },
  ["<leader>b7"] = { "<cmd>BufferGoto 7<CR>", "Go to buffer 7", mode = "n", group="Buffers navigation" },
  ["<leader>b8"] = { "<cmd>BufferGoto 8<CR>", "Go to buffer 8", mode = "n", group="Buffers navigation" },
  ["<leader>b9"] = { "<cmd>BufferGoto 9<CR>", "Go to buffer 9", mode = "n", group="Buffers navigation" },
  ["<leader>b0"] = { "<cmd>BufferGoto 10<CR>", "Go to buffer 10", mode = "n", group="Buffers navigation" },

  -- Buscar no buffer
  ["<leader>sr"] = { "<cmd>%s/<C-r><C-w>//gc<Left><Left>", "Substitute in buffer", mode = "n", group = "Search & Replace" },
  ["<leader>sf"] = { "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Search for > ') })<CR>", "Find and navigate references", mode = "n", group = "Search & Replace" },
  ["<leader>sc"] = { "<cmd>noh<CR>", "Clear search highlights", mode = "n", group = "Search & Replace" },
  ["/"] = { "<cmd>/", "Start search", mode = "n", group = "Search & Replace" },
  ["?"] = { "<cmd>?", "Start backward search", mode = "n", group = "Search & Replace" },
  ["n"] = { "<cmd>n<CR>", "Next search result", mode = "n", group = "Search & Replace" },
  ["b"] = { "<cmd>N<CR>", "Previous search result", mode = "n", group = "Search & Replace" },


  -- Telescope
  ["<leader>ff"] = {
    function()
      require("telescope.builtin").find_files()
    end,
    "Find files (Telescope)",
    mode = "n",
    group = "Files Search"
  },
  ["<leader>fg"] = {
    function()
      require("telescope.builtin").live_grep()
    end,
    "Live grep (Telescope)",
    mode = "n",
    group = "Files Search"
  },
  ["<leader>fb"] = {
    function()
      require("telescope.builtin").buffers()
    end,
    "List buffers (Telescope)",
    mode = "n",
    group = "Files Search"
  },
  ["<leader>fh"] = {
    function()
      require("telescope.builtin").help_tags()
    end,
    "Help tags (Telescope)",
    mode = "n",
    group = "Files Search"
  },

  -- Harpoon
  ["<leader>fa"] = {
    function()
      require("harpoon").mark.add_file()
    end,
    "Add file to Harpoon",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>fe"] = {
    function()
      require("harpoon").ui.toggle_quick_menu()
    end,
    "Toggle Harpoon quick menu",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>f1"] = {
    function()
      require("harpoon").ui.nav_file(1)
    end,
    "Navigate to file 1 in Harpoon",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>f2"] = {
    function()
      require("harpoon").ui.nav_file(2)
    end,
    "Navigate to file 2 in Harpoon",
    mone = "n",
    group = "Files Navigation"
  },
  ["<leader>f3"] = {
    function()
      require("harpoon").ui.nav_file(3)
    end,
    "Navigate to file 3 in Harpoon",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>f4"] = {
    function()
      require("harpoon").ui.nav_file(4)
    end,
    "Navigate to file 4 in Harpoon",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>fp"] = {
    function()
      require("harpoon").ui.nav_prev()
    end,
    "Navigate to previous file in Harpoon",
    mode = "n",
    group = "Files Navigation"
  },
  ["<leader>fn"] = {
    function()
      require("harpoon").ui.nav_next()
    end,
    "Navigate to next file in Harpoon",
    mode = "n",
    group = "Files Navigation"
  },

  -- Comments
  ["<leader>cc"] = { "<cmd>CommentToggle<CR>", "Toggle line comment", mode = "n", group="Comments" },
  ["<leader>cu"] = { "<cmd>CommentToggle<CR>", "Toggle line comment", mode = "v", group="Comments" },
  ["<leader>cb"] = { "<cmd>lua require('nvim_comment').comment({blockwise = true})<CR>", "Toggle block comment", mode = "v", group="Comments" },

-- LSP
  ["gd"] = {
    function() vim.lsp.buf.definition() end,
    desc = "Go to definition (LSP)",
    mode = "n",
    groudp = "Code Navigation"
  },
  ["gr"] = {
    function() vim.lsp.buf.references() end,
    desc = "References (LSP)",
    mode = "n",
    groudp = "Code Navigation"
  },
  ["gi"] = {
    function() vim.lsp.buf.implementation() end,
    desc = "Go to implementation (LSP)",
    mode = "n",
    groudp = "Code Navigation"
  },
  ["<leader>rn"] = {
    function() vim.lsp.buf.rename() end,
    desc = "Rename (LSP)",
    mode = "n",
    groudp = "Code utils"
  },
  ["<leader>ca"] = {
    function() vim.lsp.buf.code_action() end,
    desc = "Code action (LSP)",
    mode = "n",
    groudp = "Code Navigation"
  },
  ["<leader>f"] = {
    function() vim.lsp.buf.format() end,
    desc = "Format (LSP)",
    mode = "n",
    groudp = "Code utils"
  },
  ["<leader>ce"] = {
    function() vim.diagnostic.open_float() end,
    desc = "Open floating error",
    mode = "n",
    groudp = "Code Utils"
  },
  ["[d"] = {
    function() vim.diagnostic.goto_prev() end,
    desc = "Go to previous error",
    mode = "n",
    groudp = "Code Navigation"
  },
  ["]d"] = {
    function() vim.diagnostic.goto_next() end,
    desc = "Go to next error",
    mode = "n",
    groudp = "Code Navigation"
  },

  -- Troubles
  ["<leader>xx"] = {
    "<cmd>Trouble diagnostics toggle<CR>",
    desc = "Open/close Trouble",
    mode = "n",
    groudp = {"Code Utils", "Debugger Utils"}
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
    mode = "i",
    group = "Code Navigation"
  },
  ["<C-p>"] = {
    function() require("cmp").mapping.select_prev_item() end,
    desc = "Previous item in suggestion list",
    mode = "i",
    group = "Code Navigation"
  },
  ["<C-e>"] = {
    function() require("cmp").mapping.close() end,
    desc = "Close suggestion window",
    mode = "i",
    group = "Code Navigation"
  },

  -- Emmet
  ["<C-y>"] = {
    "<Plug>(emmet-expand-abbr)",
    desc = "Expand Emmet abbreviation",
    mode = "i",
    group = "Code Utils"
  },
}

