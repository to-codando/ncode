local utils = require('utils')

local keymaps = {
  -- NvimTree
  n = {
    ["<leader>e"] = { rhs = "<cmd>NvimTreeToggle<CR>", desc = "Alternar Explorer" },
    ["<leader>er"] = { rhs = "<cmd>NvimTreeRename<CR>", desc = "Renomear" },
    ["<leader>ec"] = { rhs = "<cmd>NvimTreeCopy<CR>", desc = "Copiar" },
    ["<leader>em"] = { rhs = "<cmd>NvimTreeMove<CR>", desc = "Mover" },
    ["<leader>ea"] = { rhs = "<cmd>NvimTreeCreate<CR>", desc = "Criar" },
    ["<leader>ed"] = { rhs = "<cmd>NvimTreeRemove<CR>", desc = "Deletar" },

    -- Comandos básicos
    ["<leader>w"] = { rhs = "<cmd>w<CR>", desc = "Salvar" },
    ["<leader>q"] = { rhs = "<cmd>q<CR>", desc = "Sair" },
    ["<leader>nc"] = { rhs = "<cmd>lua require('notify').dismiss()<CR>", desc = "Fechar notificação" },
    ["<leader>bc"] = { rhs = "<cmd>enew<CR>", desc = "Criar novo buffer" },

    -- Navegação em janelas
    ["<leader>a"] = {
      rhs = function()
        require("nvim-window").pick()
      end,
      desc = "Navegar entre janelas (nvim-window)"
    },

    -- Manipulação de janelas
    ["<leader>sv"] = { rhs = ":vsp<CR>", desc = "Split vertical" },
    ["<leader>sh"] = { rhs = ":sp<CR>", desc = "Split horizontal" },
    ["<leader>wr"] = { rhs = ":WinResizerStartResize<CR>", desc = "Redimensionar janela (WinResizer)" },
    ["<leader>wm"] = { rhs = "<cmd>WinShift<CR>", desc = "Ativar WinShift" },
    ["<leader>wh"] = { rhs = "<cmd>WinShiftLeft<CR>", desc = "Mover janela para a esquerda" },
    ["<leader>wj"] = { rhs = "<cmd>WinShiftDown<CR>", desc = "Mover janela para baixo" },
    ["<leader>wk"] = { rhs = "<cmd>WinShiftUp<CR>", desc = "Mover janela para cima" },
    ["<leader>wl"] = { rhs = "<cmd>WinShiftRight<CR>", desc = "Mover janela para a direita" },
    ["<leader>rh"] = { rhs = "<cmd>WinShiftResizeLeft<CR>", desc = "Redimensionar janela para a esquerda" },
    ["<leader>rj"] = { rhs = "<cmd>WinShiftResizeDown<CR>", desc = "Redimensionar janela para baixo" },
    ["<leader>rk"] = { rhs = "<cmd>WinShiftResizeUp<CR>", desc = "Redimensionar janela para cima" },
    ["<leader>rl"] = { rhs = "<cmd>WinShiftResizeRight<CR>", desc = "Redimensionar janela para a direita" },

    -- Navegação em buffers
    ["<leader>bn"] = { rhs = "<cmd>BufferLineCycleNext<CR>", desc = "Próximo buffer" },
    ["<leader>bp"] = { rhs = "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer anterior" },
    ["<leader>bj"] = { rhs = "<cmd>BufferLinePick<CR>", desc = "Escolher buffer" },
    ["<leader>bq"] = { rhs = "<cmd>BufferLinePickClose<CR>", desc = "Escolher e fechar buffer" },
    ["<leader>br"] = { rhs = "<cmd>BufferLineCloseRight<CR>", desc = "Fechar buffers à direita" },
    ["<leader>bl"] = { rhs = "<cmd>BufferLineCloseLeft<CR>", desc = "Fechar buffers à esquerda" },
    ["<leader>bo"] = { rhs = "<cmd>BufferLineCloseOthers<CR>", desc = "Fechar outros buffers" },
    ["<leader>b1"] = { rhs = "<cmd>BufferGoto 1<CR>", desc = "Ir para o buffer 1" },
    ["<leader>b2"] = { rhs = "<cmd>BufferGoto 2<CR>", desc = "Ir para o buffer 2" },
    ["<leader>b3"] = { rhs = "<cmd>BufferGoto 3<CR>", desc = "Ir para o buffer 3" },
    ["<leader>b4"] = { rhs = "<cmd>BufferGoto 4<CR>", desc = "Ir para o buffer 4" },
    ["<leader>b5"] = { rhs = "<cmd>BufferGoto 5<CR>", desc = "Ir para o buffer 5" },
    ["<leader>b6"] = { rhs = "<cmd>BufferGoto 6<CR>", desc = "Ir para o buffer 6" },
    ["<leader>b7"] = { rhs = "<cmd>BufferGoto 7<CR>", desc = "Ir para o buffer 7" },
    ["<leader>b8"] = { rhs = "<cmd>BufferGoto 8<CR>", desc = "Ir para o buffer 8" },
    ["<leader>b9"] = { rhs = "<cmd>BufferGoto 9<CR>", desc = "Ir para o buffer 9" },
    ["<leader>b0"] = { rhs = "<cmd>BufferGoto 10<CR>", desc = "Ir para o buffer 10" },

    -- Telescope
    ["<leader>ff"] = {
      rhs = function()
        require("telescope.builtin").find_files()
      end,
      desc = "Encontrar arquivos (Telescope)"
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
      desc = "Listar buffers (Telescope)"
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
      desc = "Adicionar arquivo ao Harpoon"
    },
    ["<leader>fe"] = {
      rhs = function()
        require("harpoon").ui.toggle_quick_menu()
      end,
      desc = "Alternar menu rápido do Harpoon"
    },
    ["<leader>f1"] = {
      rhs = function()
        require("harpoon").ui.nav_file(1)
      end,
      desc = "Navegar para o arquivo 1 no Harpoon"
    },
    ["<leader>f2"] = {
      rhs = function()
        require("harpoon").ui.nav_file(2)
      end,
      desc = "Navegar para o arquivo 2 no Harpoon"
    },
    ["<leader>f3"] = {
      rhs = function()
        require("harpoon").ui.nav_file(3)
      end,
      desc = "Navegar para o arquivo 3 no Harpoon"
    },
    ["<leader>f4"] = {
      rhs = function()
        require("harpoon").ui.nav_file(4)
      end,
      desc = "Navegar para o arquivo 4 no Harpoon"
    },
    ["<leader>fp"] = {
      rhs = function()
        require("harpoon").ui.nav_prev()
      end,
      desc = "Navegar para o arquivo anterior no Harpoon"
    },
    ["<leader>fn"] = {
      rhs = function()
        require("harpoon").ui.nav_next()
      end,
      desc = "Navegar para o próximo arquivo no Harpoon"
    },

    -- Comentários
    ["<leader>cc"] = { rhs = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Comentar/descomentar linha" },
    ["<leader>cb"] = { rhs = "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>", desc = "Comentar/descomentar bloco" },
    ["<leader>cu"] = { rhs = "<cmd>lua require('Comment.api').unlock.current()<CR>", desc = "Descomentar linha" },

    -- LSP
    ["gd"] = { rhs = vim.lsp.buf.definition, desc = "Ir para definição (LSP)" },
    ["gr"] = { rhs = vim.lsp.buf.references, desc = "Referências (LSP)" },
    ["gi"] = { rhs = vim.lsp.buf.implementation, desc = "Ir para implementação (LSP)" },
    ["<leader>rn"] = { rhs = vim.lsp.buf.rename, desc = "Renomear (LSP)" },
    ["<leader>ca"] = { rhs = vim.lsp.buf.code_action, desc = "Ação de código (LSP)" },
    ["<leader>f"] = { rhs = vim.lsp.buf.format, desc = "Formatar (LSP)" },
    ["<leader>ce"] = { rhs = vim.diagnostic.open_float, desc = "Abrir erro flutuante" },
    ["[d"] = { rhs = vim.diagnostic.goto_prev, desc = "Ir para o erro anterior" },
    ["]d"] = { rhs = vim.diagnostic.goto_next, desc = "Ir para o próximo erro" },

    -- Troubles
    ["<leader>xx"] = { rhs = "<cmd>Trouble diagnostics toggle<CR>", desc = "Abrir/fechar Trouble" },

    -- TypeScript tools (comentados)
    -- ["<leader>oi"] = { rhs = ":TSToolsOrganizeImports<CR>", desc = "Organizar imports (TypeScript)" },
    -- ["<leader>si"] = { rhs = ":TSToolsSortImports<CR>", desc = "Ordenar imports (TypeScript)" },
    -- ["<leader>ri"] = { rhs = ":TSToolsRemoveUnusedImports<CR>", desc = "Remover imports não utilizados (TypeScript)" },
    -- ["<leader>ru"] = { rhs = ":TSToolsRemoveUnused<CR>", desc = "Remover código não utilizado (TypeScript)" },
    -- ["<leader>ai"] = { rhs = ":TSToolsAddMissingImports<CR>", desc = "Adicionar imports faltantes (TypeScript)" },
    -- ["<leader>fa"] = { rhs = ":TSToolsFixAll<CR>", desc = "Corrigir todos os erros (TypeScript)" },
    -- ["<leader>gsd"] = { rhs = ":TSToolsGoToSourceDefinition<CR>", desc = "Ir para definição (TypeScript)" },
    -- ["<leader>rf"] = { rhs = ":TSToolsRenameFile<CR>", desc = "Renomear arquivo (TypeScript)" },
    -- ["<leader>fr"] = { rhs = ":TSToolsFileReferences<CR>", desc = "Encontrar referências do arquivo (TypeScript)" },
  },

  -- Autocomplete (cmp)
  i = {
    ["<C-n>"] = { rhs = require("cmp").mapping.select_next_item, desc = "Próximo item na lista de sugestões" },
    ["<C-p>"] = { rhs = require("cmp").mapping.select_prev_item, desc = "Item anterior na lista de sugestões" },
    ["<C-e>"] = { rhs = require("cmp").mapping.close, desc = "Fechar a janela de sugestões" },

    -- Emmet
    ["<C-y>"] = { rhs = "<Plug>(emmet-expand-abbr)", desc = "Expandir abreviação Emmet" },
  },
}


utils.set_keymaps(keymaps)

