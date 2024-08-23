return {

  -- Basic commands
  ["<leader>k"] = {
    name = " Common",
    mode = "n",

    ["k"] = { ':lua require("telescope.builtin").keymaps()<CR>', "Show keymaps" },
    ["b"] = {
      function()
        require("which-key").show()
      end,
      "Show which-key panel",
    },
    ["w"] = { "<cmd>w<CR>", "Save" },
    ["q"] = { "<cmd>qa!<CR>", "Quit all buffers" },
    ["c"] = { "<cmd>lua require('notify').dismiss()<CR>", "Close notification" },
    ["n"] = { "<cmd>enew<CR>", "Create new buffer" },
    ["a"] = {
      function()
        require("nvim-window").pick()
      end,
      "Windows navigation",
    },
    ["o"] = {
      function()
        require("functions").create_file()
      end,
      "Open File Manager",
    },
  },

  -- Window management
  ["<leader>w"] = {
    name = "Window",
    mode = "n",
    ["s"] = {
      name = "Split", -- Nome do subgrupo
      ["v"] = { ":vsp<CR>", "Vertical split" },
      ["h"] = { ":sp<CR>", "Horizontal split" },
    },
    ["r"] = {
      name = "Resize", -- Nome do subgrupo
      ["h"] = { ":WinShiftResizeLeft<CR>", "Resize window left" },
      ["j"] = { ":WinShiftResizeDown<CR>", "Resize window down" },
      ["k"] = { ":WinShiftResizeUp<CR>", "Resize window up" },
      ["l"] = { ":WinShiftResizeRight<CR>", "Resize window right" },
    },
    ["m"] = {
      name = "Move", -- Nome do subgrupo
      ["h"] = { "<cmd>WinShiftLeft<CR>", "Move window left" },
      ["j"] = { "<cmd>WinShiftDown<CR>", "Move window down" },
      ["k"] = { "<cmd>WinShiftUp<CR>", "Move window up" },
      ["l"] = { "<cmd>WinShiftRight<CR>", "Move window right" },
    },
    ["n"] = {
      name = "Navigation",
      ["a"] = {
        function()
          require("nvim-window").pick()
        end,
        "Windows navigation",
      },
    },
  },

  -- Buffer management
  ["<leader>b"] = {
    name = "Buffers",
    mode = "n",
    ["j"] = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
    ["r"] = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the right" },
    ["c"] = { "<cmd>bd!<CR>", "Close current buffer" },
    ["l"] = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the left" },
    ["o"] = { "<cmd>BufferLineCloseOthers<CR>", "Close other buffers" },
    ["n"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    ["p"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
    ["q"] = { "<cmd>BufferLinePickClose<CR>", "Pick and close buffer" },
    ["1"] = { "<cmd>BufferGoto 1<CR>", "Go to buffer 1" },
    ["2"] = { "<cmd>BufferGoto 2<CR>", "Go to buffer 2" },
    ["3"] = { "<cmd>BufferGoto 3<CR>", "Go to buffer 3" },
    ["4"] = { "<cmd>BufferGoto 4<CR>", "Go to buffer 4" },
    ["5"] = { "<cmd>BufferGoto 5<CR>", "Go to buffer 5" },
    ["6"] = { "<cmd>BufferGoto 6<CR>", "Go to buffer 6" },
    ["7"] = { "<cmd>BufferGoto 7<CR>", "Go to buffer 7" },
    ["8"] = { "<cmd>BufferGoto 8<CR>", "Go to buffer 8" },
    ["9"] = { "<cmd>BufferGoto 9<CR>", "Go to buffer 9" },
    ["0"] = { "<cmd>BufferGoto 10<CR>", "Go to buffer 10" },
  },

  -- Search & Replace
  ["<leader>s"] = {
    name = "Search & Replace",
    mode = "n",
    ["r"] = { "<cmd>%s/<C-r><C-w>//gc<Left><Left>", "replace local ocurrences" },
    ["g"] = {
      "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Search for > ') })<CR>",
      "Find global references",
    },
    ["c"] = { "<cmd>noh<CR>", "Clear highlights" },
    ["s"] = { "<cmd>/", "Start search" },
    ["b"] = { "<cmd>?", "Start backward search" },
    ["n"] = { "<cmd>n<CR>", "Next search result" },
    ["p"] = { "<cmd>N<CR>", "Previous search result" },
  },

  -- Nvim-tree
  ["<leader>e"] = {
    name = "File Explorer",
    mode = "n",
    ["t"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Explorer" },
    ["r"] = { "<cmd>NvimTreeRename<CR>", "Rename" },
    ["c"] = { "<cmd>NvimTreeCopy<CR>", "Copy" },
    ["x"] = { "<cmd>NvimTreeMove<CR>", "Move" },
    ["a"] = { "<cmd>NvimTreeCreate<CR>", "Create" },
    ["d"] = { "<cmd>NvimTreeRemove<CR>", "Delete" },
  },

  --File Manager
  ["<leader>f"] = {
    mode = "n",
    name = "File Manager",
    ["f"] = {
      function()
        require("telescope.builtin").find_files()
      end,
      "Find files (Telescope)",
    },
    ["g"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Live grep (Telescope)",
    },
    ["b"] = {
      function()
        require("telescope.builtin").buffers()
      end,
      "List buffers (Telescope)",
    },
    ["h"] = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Help tags (Telescope)",
    },

    -- Oil File Browser
    ["o"] = {
      function()
        require("functions").create_file()
      end,
      "Open File Manager",
    },
  },

  -- Harpoon
  ["<leader>h"] = {
    name = "File Navigation",
    mode = "n",
    ["a"] = {
      function()
        require("harpoon").mark.add_file()
      end,
      "Add file to Harpoon",
    },
    ["t"] = {
      function()
        require("harpoon").ui.toggle_quick_menu()
      end,
      "Toggle Harpoon quick menu",
    },
    ["1"] = {
      function()
        require("harpoon").ui.nav_file(1)
      end,
      "Navigate to file 1 in Harpoon",
    },
    ["2"] = {
      function()
        require("harpoon").ui.nav_file(2)
      end,
      "Navigate to file 2 in Harpoon",
    },
    ["3"] = {
      function()
        require("harpoon").ui.nav_file(3)
      end,
      "Navigate to file 3 in Harpoon",
    },
    ["4"] = {
      function()
        require("harpoon").ui.nav_file(4)
      end,
      "Navigate to file 4 in Harpoon",
    },
    ["p"] = {
      function()
        require("harpoon").ui.nav_prev()
      end,
      "Navigate to previous file in Harpoon",
    },
    ["n"] = {
      function()
        require("harpoon").ui.nav_next()
      end,
      "Navigate to next file in Harpoon",
    },
  },

  -- Comments
  ["<leader>c"] = {
    name = "Comments",
    mode = { "n", "v" },
    ["l"] = {
      "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      "Toggle line comment",
    },
    ["b"] = {
      "<cmd>lua require('Comment.api').toggle.blockwise()<CR>",
      "Toggle block comment",
    },
  },

  -- LSP
  ["<leader>n"] = {
    name = "Code Navigation",
    mode = "n",
    ["d"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "Go to definition (LSP)",
    },
    ["r"] = {
      function()
        vim.lsp.buf.references()
      end,
      "References (LSP)",
    },
    ["i"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "Go to implementation (LSP)",
    },
    ["rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Rename (LSP)",
    },
    ["ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action (LSP)",
    },
    ["f"] = {
      function()
        vim.lsp.buf.format()
      end,
      "Format (LSP)",
    },
    ["ce"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Open floating error",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Go to previous error",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Go to next error",
    },
  },

  ["<leader>d"] = {
    name = "Debugger",
    mode = "n",
    ["x"] = { "<cmd>Trouble diagnostics toggle<CR>", "Toggle diagnostics" },
    ["t"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["r"] = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
    ["l"] = { "<cmd>lua require'dap'.run_last()<CR>", "Run last" },
    ["b"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "Set conditional breakpoint",
    },
    ["p"] = { "<cmd>lua require'dap'.pause()<CR>", "Pause debugging" },
    ["f"] = { "<cmd>lua require'dap'.terminate()<CR>", "Finish debugging" },

    ["<F5>"] = { "<cmd>lua require('dap_ui').select_dap_config()<CR>", "Start debugging" },
    ["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
    ["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
    ["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
  },

  -- LSP Saga
  ["<leader>l"] = {
    name = "LSP Saga",
    mode = "n",
    ["h"] = { "<Cmd>Lspsaga hover_doc<CR>", "Hover documentation" },
    ["d"] = { "<Cmd>Lspsaga preview_definition<CR>", "Preview definition" },
    ["a"] = { "<Cmd>Lspsaga code_action<CR>", "Code action" },
    ["r"] = { "<Cmd>Lspsaga rename<CR>", "Rename" },
    ["f"] = { "<Cmd>Lspsaga lsp_finder<CR>", "Find LSP references" },
    ["e"] = { "<Cmd>Lspsaga show_line_diagnostics<CR>", "Show line diagnostics" },
    ["s"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostic" },
    ["S"] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to previous diagnostic" },
    ["c"] = { "<Cmd>Lspsaga goto_definition<CR>", "Go to definition" },
    ["o"] = { "<Cmd>Lspsaga outline<CR>", "Show outline" },
  },

  ["<C-y>,"] = { "<Plug>(emmet-expand-abbr)", "Emmet Expand", mode = "i" },
}
